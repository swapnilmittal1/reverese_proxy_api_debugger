@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  magritte-bootvisor-jre startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and MAGRITTE_BOOTVISOR_JRE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="--add-opens" "java.base/sun.nio.ch=ALL-UNNAMED"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\magritte-bootvisor-jre-1.500.0.jar;%APP_HOME%\lib\main;%APP_HOME%\lib\main;%APP_HOME%\lib\magritte-bootvisor-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-render-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-packages-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-signing-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-startup-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-errors-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-logging-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-polling-1.500.0.jar;%APP_HOME%\lib\magritte-bootvisor-errors-objects-1.500.0.jar;%APP_HOME%\lib\magritte-common-9.2323.0.jar;%APP_HOME%\lib\magritte-sdk-9.2304.0.jar;%APP_HOME%\lib\magritte-bootvisor-config-1.500.0.jar;%APP_HOME%\lib\witchcraft-4.237.0.jar;%APP_HOME%\lib\witchcraft-logging-log4j-4.237.0.jar;%APP_HOME%\lib\sls-logging-log4j-service-10.10.0.jar;%APP_HOME%\lib\sls-logging-log4j-10.10.0.jar;%APP_HOME%\lib\magritte-credential-encryption-lib-9.2393.0.jar;%APP_HOME%\lib\magritte-bootvisor-common-9.2323.0.jar;%APP_HOME%\lib\magritte-coordinator-api-9.2415.0.jar;%APP_HOME%\lib\conjure-java-jaxrs-client-8.18.0.jar;%APP_HOME%\lib\sls-status-undertow-6.75.0.jar;%APP_HOME%\lib\sls-debug-undertow-0.90.0.jar;%APP_HOME%\lib\conjure-java-undertow-runtime-8.45.0.jar;%APP_HOME%\lib\conjure-java-jersey-jakarta-server-8.18.0.jar;%APP_HOME%\lib\dialogue-clients-5.4.0.jar;%APP_HOME%\lib\dialogue-annotations-5.4.0.jar;%APP_HOME%\lib\dialogue-serde-5.4.0.jar;%APP_HOME%\lib\magritte-coordinator-api-dialogue-9.2415.0.jar;%APP_HOME%\lib\magritte-coordinator-api-jersey-9.2415.0.jar;%APP_HOME%\lib\magritte-coordinator-api-undertow-9.2415.0.jar;%APP_HOME%\lib\magritte-coordinator-api-objects-9.2415.0.jar;%APP_HOME%\lib\sls-logging-10.10.0.jar;%APP_HOME%\lib\sls-logging-jackson-10.10.0.jar;%APP_HOME%\lib\foundry-metadata-api-objects-1.890.0.jar;%APP_HOME%\lib\hook-events-2.59.0.jar;%APP_HOME%\lib\conjure-java-jackson-serialization-8.18.0.jar;%APP_HOME%\lib\witchcraft-logging-spi-4.237.0.jar;%APP_HOME%\lib\conjure-java-legacy-clients-8.18.0.jar;%APP_HOME%\lib\dialogue-apache-hc5-client-5.4.0.jar;%APP_HOME%\lib\dialogue-core-5.4.0.jar;%APP_HOME%\lib\client-config-8.18.0.jar;%APP_HOME%\lib\tritium-lib-0.97.0.jar;%APP_HOME%\lib\deadlines-0.13.0.jar;%APP_HOME%\lib\tritium-metrics-jvm-0.97.0.jar;%APP_HOME%\lib\tritium-caffeine-0.97.0.jar;%APP_HOME%\lib\dialogue-blocking-channels-5.4.0.jar;%APP_HOME%\lib\tritium-metrics-0.97.0.jar;%APP_HOME%\lib\sls-logging-monitors-10.10.0.jar;%APP_HOME%\lib\sls-logging-metrics-10.10.0.jar;%APP_HOME%\lib\tritium-registry-0.97.0.jar;%APP_HOME%\lib\artifacts-types-api-0.1351.0.jar;%APP_HOME%\lib\result-0.19.0.jar;%APP_HOME%\lib\sls-status-core-6.75.0.jar;%APP_HOME%\lib\hook-events-config-2.59.0.jar;%APP_HOME%\lib\service-config-2.59.0.jar;%APP_HOME%\lib\conjure-undertow-annotations-8.45.0.jar;%APP_HOME%\lib\sls-status-api-undertow-6.75.0.jar;%APP_HOME%\lib\conjure-undertow-lib-8.45.0.jar;%APP_HOME%\lib\sls-debug-core-0.90.0.jar;%APP_HOME%\lib\sls-debug-api-0.90.0.jar;%APP_HOME%\lib\sls-logging-api-objects-10.10.0.jar;%APP_HOME%\lib\hook-events-dialogue-2.59.0.jar;%APP_HOME%\lib\dialogue-target-5.4.0.jar;%APP_HOME%\lib\sls-status-api-6.75.0.jar;%APP_HOME%\lib\sls-status-api-objects-6.75.0.jar;%APP_HOME%\lib\build2-api-objects-1.1563.0.jar;%APP_HOME%\lib\foundry-templates-api-objects-3.2378.0.jar;%APP_HOME%\lib\low-trust-network-policy-api-objects-3.1489.0.jar;%APP_HOME%\lib\magritte-coordinator-api-conjure-deps-9.2415.0.jar;%APP_HOME%\lib\magritte-coordinator-connection-api-objects-9.2415.0.jar;%APP_HOME%\lib\low-trust-service-discovery-api-objects-3.1489.0.jar;%APP_HOME%\lib\hook-events-objects-2.59.0.jar;%APP_HOME%\lib\conjure-lib-8.45.0.jar;%APP_HOME%\lib\auth-tokens-filter-jakarta-3.18.0.jar;%APP_HOME%\lib\auth-tokens-3.18.0.jar;%APP_HOME%\lib\keystores-8.18.0.jar;%APP_HOME%\lib\human-readable-types-1.7.0.jar;%APP_HOME%\lib\sls-versions-1.5.0.jar;%APP_HOME%\lib\tracing-servlet-jakarta-6.22.0.jar;%APP_HOME%\lib\tracing-undertow-6.22.0.jar;%APP_HOME%\lib\tritium-tracing-0.97.0.jar;%APP_HOME%\lib\tracing-jersey-jakarta-6.22.0.jar;%APP_HOME%\lib\tracing-6.22.0.jar;%APP_HOME%\lib\refreshable-2.5.0.jar;%APP_HOME%\lib\encrypted-config-value-module-6.0.0.jar;%APP_HOME%\lib\magritte-api-9.2556.0.jar;%APP_HOME%\lib\errors-2.59.0.jar;%APP_HOME%\lib\ssl-config-2.59.0.jar;%APP_HOME%\lib\nylon-threads-0.4.0.jar;%APP_HOME%\lib\jfr-logger-lib-0.129.0.jar;%APP_HOME%\lib\jfr-logger-impl-0.129.0.jar;%APP_HOME%\lib\jfr-logger-api-0.129.0.jar;%APP_HOME%\lib\dialogue-futures-5.4.0.jar;%APP_HOME%\lib\resource-identifier-2.9.0.jar;%APP_HOME%\lib\tritium-slf4j-0.97.0.jar;%APP_HOME%\lib\tritium-core-0.97.0.jar;%APP_HOME%\lib\encrypted-config-value-6.0.0.jar;%APP_HOME%\lib\tritium-ids-0.97.0.jar;%APP_HOME%\lib\preconditions-3.9.0.jar;%APP_HOME%\lib\streams-2.4.0.jar;%APP_HOME%\lib\jackson-datatype-guava-2.18.3.jar;%APP_HOME%\lib\guava-retrying-v2.0.0.jar;%APP_HOME%\lib\refresh-utils-8.18.0.jar;%APP_HOME%\lib\guava-33.4.8-jre.jar;%APP_HOME%\lib\caffeine-3.2.0.jar;%APP_HOME%\lib\logger-3.9.0.jar;%APP_HOME%\lib\logger-slf4j-3.9.0.jar;%APP_HOME%\lib\logger-log4j-3.9.0.jar;%APP_HOME%\lib\logger-spi-3.9.0.jar;%APP_HOME%\lib\error_prone_annotations-2.36.0.jar;%APP_HOME%\lib\junit-jupiter-5.12.2.jar;%APP_HOME%\lib\jersey-bean-validation-3.1.3.jar;%APP_HOME%\lib\hibernate-validator-8.0.1.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.18.3.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.18.3.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.18.3.jar;%APP_HOME%\lib\jersey-media-json-jackson-3.1.3.jar;%APP_HOME%\lib\jackson-jakarta-rs-cbor-provider-2.18.3.jar;%APP_HOME%\lib\jackson-module-jakarta-xmlbind-annotations-2.18.3.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.18.3.jar;%APP_HOME%\lib\jackson-dataformat-smile-2.18.3.jar;%APP_HOME%\lib\jackson-datatype-joda-2.18.3.jar;%APP_HOME%\lib\conjure-java-jackson-optimizations-8.18.0.jar;%APP_HOME%\lib\feign-jackson-8.18.0.jar;%APP_HOME%\lib\jackson-jakarta-rs-base-2.18.3.jar;%APP_HOME%\lib\jackson-databind-2.18.3.jar;%APP_HOME%\lib\jackson-annotations-2.18.3.jar;%APP_HOME%\lib\jackson-core-2.18.3.jar;%APP_HOME%\lib\auto-service-annotations-1.1.1.jar;%APP_HOME%\lib\reflections-0.10.2.jar;%APP_HOME%\lib\hdrhistogram-metrics-reservoir-1.1.3.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\failureaccess-1.0.3.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\j2objc-annotations-3.0.0.jar;%APP_HOME%\lib\disruptor-3.4.4.jar;%APP_HOME%\lib\feign-core-8.18.0.jar;%APP_HOME%\lib\conjure-java-annotations-8.18.0.jar;%APP_HOME%\lib\constant-strings-lib-0.117.0.jar;%APP_HOME%\lib\constant-strings-registry-0.117.0.jar;%APP_HOME%\lib\jvm-diagnostics-0.5.0.jar;%APP_HOME%\lib\safe-logging-3.9.0.jar;%APP_HOME%\lib\safe-thread-local-random-0.3.0.jar;%APP_HOME%\lib\sls-logging-log4j-slf4j-10.10.0.jar;%APP_HOME%\lib\tracing-api-6.22.0.jar;%APP_HOME%\lib\tritium-api-0.97.0.jar;%APP_HOME%\lib\tritium-proxy-0.97.0.jar;%APP_HOME%\lib\tritium-time-0.97.0.jar;%APP_HOME%\lib\metrics-jvm-4.2.30.jar;%APP_HOME%\lib\metrics-core-4.2.30.jar;%APP_HOME%\lib\undertow-servlet-2.3.18.Final.jar;%APP_HOME%\lib\undertow-core-2.3.18.Final.jar;%APP_HOME%\lib\xnio-nio-3.8.16.Final.jar;%APP_HOME%\lib\xnio-api-3.8.16.Final.jar;%APP_HOME%\lib\jboss-threads-3.8.0.Final.jar;%APP_HOME%\lib\smallrye-common-annotation-2.6.0.jar;%APP_HOME%\lib\wildfly-common-2.0.1.jar;%APP_HOME%\lib\smallrye-common-expression-2.4.0.jar;%APP_HOME%\lib\smallrye-common-function-2.6.0.jar;%APP_HOME%\lib\smallrye-common-net-2.4.0.jar;%APP_HOME%\lib\smallrye-common-ref-2.4.0.jar;%APP_HOME%\lib\smallrye-common-constraint-2.6.0.jar;%APP_HOME%\lib\smallrye-common-cpu-2.6.0.jar;%APP_HOME%\lib\smallrye-common-os-2.4.0.jar;%APP_HOME%\lib\jakarta.xml.bind-api-4.0.0.jar;%APP_HOME%\lib\jakarta.activation-api-2.1.0.jar;%APP_HOME%\lib\jersey-container-servlet-3.1.3.jar;%APP_HOME%\lib\jersey-container-servlet-core-3.1.3.jar;%APP_HOME%\lib\jersey-server-3.1.3.jar;%APP_HOME%\lib\jersey-hk2-3.1.3.jar;%APP_HOME%\lib\jersey-client-3.1.3.jar;%APP_HOME%\lib\jersey-common-3.1.3.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.1.jar;%APP_HOME%\lib\jakarta.el-5.0.0-M1.jar;%APP_HOME%\lib\jakarta.el-api-5.0.0.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.1.jar;%APP_HOME%\lib\jakarta.servlet-api-6.0.0.jar;%APP_HOME%\lib\jakarta.validation-api-3.0.2.jar;%APP_HOME%\lib\jersey-entity-filtering-3.1.3.jar;%APP_HOME%\lib\jakarta.ws.rs-api-3.1.0.jar;%APP_HOME%\lib\joda-time-2.14.0.jar;%APP_HOME%\lib\byte-buddy-1.17.4.jar;%APP_HOME%\lib\streamex-0.8.3.jar;%APP_HOME%\lib\commons-compress-1.27.1.jar;%APP_HOME%\lib\commons-text-1.13.1.jar;%APP_HOME%\lib\commons-lang3-3.17.0.jar;%APP_HOME%\lib\httpclient5-5.3.1.jar;%APP_HOME%\lib\httpcore5-h2-5.2.4.jar;%APP_HOME%\lib\httpcore5-5.3.3.jar;%APP_HOME%\lib\log4j-core-2.24.3.jar;%APP_HOME%\lib\log4j-jul-2.24.3.jar;%APP_HOME%\lib\log4j-jcl-2.24.3.jar;%APP_HOME%\lib\log4j-jpl-2.24.3.jar;%APP_HOME%\lib\log4j-api-2.24.3.jar;%APP_HOME%\lib\checker-qual-3.43.0.jar;%APP_HOME%\lib\eclipse-collections-11.1.0.jar;%APP_HOME%\lib\eclipse-collections-api-11.1.0.jar;%APP_HOME%\lib\hk2-locator-3.0.4.jar;%APP_HOME%\lib\hk2-api-3.0.4.jar;%APP_HOME%\lib\hk2-utils-3.0.4.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar;%APP_HOME%\lib\aopalliance-repackaged-3.0.4.jar;%APP_HOME%\lib\HdrHistogram-2.2.2.jar;%APP_HOME%\lib\value-2.10.1-annotations.jar;%APP_HOME%\lib\javassist-3.29.2-GA.jar;%APP_HOME%\lib\wildfly-client-config-1.0.1.Final.jar;%APP_HOME%\lib\jboss-logging-3.6.1.Final.jar;%APP_HOME%\lib\okhttp-4.12.0.jar;%APP_HOME%\lib\okio-3.6.0.jar;%APP_HOME%\lib\okio-jvm-3.6.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.9.10.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.9.10.jar;%APP_HOME%\lib\kotlin-stdlib-1.9.10.jar;%APP_HOME%\lib\annotations-26.0.2.jar;%APP_HOME%\lib\jspecify-1.0.0.jar;%APP_HOME%\lib\animal-sniffer-annotation-1.0.jar;%APP_HOME%\lib\jcl-over-slf4j-2.0.13.jar;%APP_HOME%\lib\jul-to-slf4j-2.0.13.jar;%APP_HOME%\lib\log4j-over-slf4j-2.0.13.jar;%APP_HOME%\lib\slf4j-api-2.0.13.jar;%APP_HOME%\lib\snakeyaml-2.4.jar;%APP_HOME%\lib\witchcraft-graal-reflection-4.237.0.jar;%APP_HOME%\lib\witchcraft-service-stw-gc-4.237.0.jar;%APP_HOME%\lib\commons-codec-1.17.1.jar;%APP_HOME%\lib\commons-io-2.19.0.jar;%APP_HOME%\lib\metrics-annotation-4.2.30.jar;%APP_HOME%\lib\javax.ws.rs-api-2.1.1.jar;%APP_HOME%\lib\commons-collections4-4.4.jar;%APP_HOME%\lib\maven-artifact-3.9.9.jar;%APP_HOME%\lib\junit-jupiter-params-5.12.2.jar;%APP_HOME%\lib\junit-jupiter-engine-5.12.2.jar;%APP_HOME%\lib\junit-jupiter-api-5.12.2.jar;%APP_HOME%\lib\junit-platform-engine-1.12.2.jar;%APP_HOME%\lib\junit-platform-commons-1.12.2.jar;%APP_HOME%\lib\apiguardian-api-1.1.2.jar;%APP_HOME%\lib\awaitility-4.3.0.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.70.jar;%APP_HOME%\lib\bcutil-jdk15on-1.70.jar;%APP_HOME%\lib\bcprov-jdk15on-1.70.jar;%APP_HOME%\lib\plexus-utils-3.5.1.jar;%APP_HOME%\lib\hamcrest-2.2.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.9.10.jar;%APP_HOME%\lib\opentest4j-1.3.0.jar;%APP_HOME%\lib\semver4j-4.1.0.jar


@rem Execute magritte-bootvisor-jre
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %MAGRITTE_BOOTVISOR_JRE_OPTS%  -classpath "%CLASSPATH%" com.palantir.magritte.bootvisor.BootvisorServer %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable MAGRITTE_BOOTVISOR_JRE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%MAGRITTE_BOOTVISOR_JRE_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
