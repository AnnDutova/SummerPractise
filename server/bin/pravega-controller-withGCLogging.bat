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

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  pravega-controller-withGCLogging startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and PRAVEGA_CONTROLLER_WITH_GC_LOGGING_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-server" "-Xms128m" "-XX:+HeapDumpOnOutOfMemoryError" "-XX:+PrintGCDetails" "-XX:+PrintGCDateStamps" "-Xloggc:PRAVEGA_APP_HOME/logs/gc.log" "-XX:+UseGCLogFileRotation" "-XX:NumberOfGCLogFiles=2" "-XX:GCLogFileSize=64m" "-Dconfig.file=PRAVEGA_APP_HOME/conf/controller.config.properties" "-Dlogback.configurationFile=PRAVEGA_APP_HOME/conf/logback.xml" "-Dlog.dir=PRAVEGA_APP_HOME/logs" "-Dlog.name=controller"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\pravega-controller-0.9.0.jar;%APP_HOME%\lib\pravega-shared-basic-authplugin-0.9.0.jar;%APP_HOME%\lib\pravega-client-0.9.0.jar;%APP_HOME%\lib\pravega-shared-security-0.9.0.jar;%APP_HOME%\lib\pravega-shared-controller-api-0.9.0.jar;%APP_HOME%\lib\pravega-shared-cluster-0.9.0.jar;%APP_HOME%\lib\pravega-shared-metrics-0.9.0.jar;%APP_HOME%\lib\pravega-shared-protocol-0.9.0.jar;%APP_HOME%\lib\pravega-common-0.9.0.jar;%APP_HOME%\lib\pravega-shared-authplugin-0.9.0.jar;%APP_HOME%\lib\curator-recipes-4.0.1.jar;%APP_HOME%\lib\curator-framework-4.0.1.jar;%APP_HOME%\lib\curator-client-4.0.1.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\micrometer-registry-influx-1.2.0.jar;%APP_HOME%\lib\zookeeper-3.5.5.jar;%APP_HOME%\lib\swagger-jersey2-jaxrs-1.5.22.jar;%APP_HOME%\lib\swagger-jaxrs-1.5.22.jar;%APP_HOME%\lib\swagger-core-1.5.22.jar;%APP_HOME%\lib\swagger-models-1.5.22.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\javax.servlet-api-4.0.0.jar;%APP_HOME%\lib\commons-lang3-3.7.jar;%APP_HOME%\lib\jersey-container-grizzly2-http-2.29.jar;%APP_HOME%\lib\jersey-hk2-2.29.jar;%APP_HOME%\lib\jersey-media-json-jackson-2.29.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.30.Final.jar;%APP_HOME%\lib\jaxb-runtime-2.3.1.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\commons-io-2.6.jar;%APP_HOME%\lib\grpc-protobuf-1.24.2.jar;%APP_HOME%\lib\grpc-stub-1.24.2.jar;%APP_HOME%\lib\grpc-auth-1.24.2.jar;%APP_HOME%\lib\grpc-netty-1.24.2.jar;%APP_HOME%\lib\grpc-core-1.24.2.jar;%APP_HOME%\lib\grpc-protobuf-lite-1.24.2.jar;%APP_HOME%\lib\grpc-api-1.24.2.jar;%APP_HOME%\lib\guava-28.2-jre.jar;%APP_HOME%\lib\jjwt-0.9.1.jar;%APP_HOME%\lib\micrometer-registry-statsd-1.2.0.jar;%APP_HOME%\lib\micrometer-core-1.2.0.jar;%APP_HOME%\lib\jersey-container-servlet-core-2.25.1.jar;%APP_HOME%\lib\jersey-media-multipart-2.25.1.jar;%APP_HOME%\lib\jersey-server-2.29.jar;%APP_HOME%\lib\jersey-client-2.29.jar;%APP_HOME%\lib\jersey-media-jaxb-2.29.jar;%APP_HOME%\lib\jersey-common-2.29.jar;%APP_HOME%\lib\hk2-locator-2.5.0.jar;%APP_HOME%\lib\hk2-api-2.5.0.jar;%APP_HOME%\lib\hk2-utils-2.5.0.jar;%APP_HOME%\lib\jakarta.inject-2.5.0.jar;%APP_HOME%\lib\grizzly-http-server-2.4.4.jar;%APP_HOME%\lib\jersey-entity-filtering-2.29.jar;%APP_HOME%\lib\jakarta.ws.rs-api-2.1.5.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.9.9.jar;%APP_HOME%\lib\jackson-databind-2.9.10.6.jar;%APP_HOME%\lib\jackson-annotations-2.9.10.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\txw2-2.3.1.jar;%APP_HOME%\lib\istack-commons-runtime-3.0.7.jar;%APP_HOME%\lib\stax-ex-1.8.jar;%APP_HOME%\lib\FastInfoset-1.2.15.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\perfmark-api-0.19.0.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-2.10.0.jar;%APP_HOME%\lib\error_prone_annotations-2.3.4.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\netty-codec-http2-4.1.50.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.50.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.50.Final.jar;%APP_HOME%\lib\netty-handler-4.1.50.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.50.Final.jar;%APP_HOME%\lib\netty-codec-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-4.1.50.Final.jar;%APP_HOME%\lib\protobuf-java-3.13.0.jar;%APP_HOME%\lib\proto-google-common-protos-1.12.0.jar;%APP_HOME%\lib\google-auth-library-credentials-0.13.0.jar;%APP_HOME%\lib\HdrHistogram-2.1.11.jar;%APP_HOME%\lib\LatencyUtils-2.0.3.jar;%APP_HOME%\lib\reflections-0.9.11.jar;%APP_HOME%\lib\javax.inject-2.5.0-b32.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.1.jar;%APP_HOME%\lib\mimepull-1.9.6.jar;%APP_HOME%\lib\zookeeper-jute-3.5.5.jar;%APP_HOME%\lib\audience-annotations-0.5.0.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\grizzly-http-2.4.4.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.4.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar;%APP_HOME%\lib\validation-api-2.0.1.Final.jar;%APP_HOME%\lib\aopalliance-repackaged-2.5.0.jar;%APP_HOME%\lib\javassist-3.22.0-CR2.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.9.8.jar;%APP_HOME%\lib\jackson-core-2.9.10.jar;%APP_HOME%\lib\netty-buffer-4.1.50.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.50.Final.jar;%APP_HOME%\lib\netty-common-4.1.50.Final.jar;%APP_HOME%\lib\gson-2.7.jar;%APP_HOME%\lib\annotations-4.1.1.4.jar;%APP_HOME%\lib\opencensus-contrib-grpc-metrics-0.21.0.jar;%APP_HOME%\lib\opencensus-api-0.21.0.jar;%APP_HOME%\lib\grpc-context-1.24.2.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.17.jar;%APP_HOME%\lib\grizzly-framework-2.4.4.jar;%APP_HOME%\lib\snakeyaml-1.23.jar;%APP_HOME%\lib\swagger-annotations-1.5.22.jar;%APP_HOME%\lib\pluginlib


@rem Execute pravega-controller-withGCLogging
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %PRAVEGA_CONTROLLER_WITH_GC_LOGGING_OPTS%  -classpath "%CLASSPATH%" io.pravega.controller.server.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable PRAVEGA_CONTROLLER_WITH_GC_LOGGING_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%PRAVEGA_CONTROLLER_WITH_GC_LOGGING_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
