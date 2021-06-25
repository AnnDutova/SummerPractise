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
@rem  pravega-segmentstore-withGCLogging startup script for Windows
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

@rem Add default JVM options here. You can also use JAVA_OPTS and PRAVEGA_SEGMENTSTORE_WITH_GC_LOGGING_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-server" "-Xms512m" "-XX:+HeapDumpOnOutOfMemoryError" "-XX:+PrintGCDetails" "-XX:+PrintGCDateStamps" "-Xloggc:PRAVEGA_APP_HOME/logs/gc.log" "-XX:+UseGCLogFileRotation" "-XX:NumberOfGCLogFiles=2" "-XX:GCLogFileSize=64m" "-Dlog.dir=PRAVEGA_APP_HOME/logs" "-Dlog.name=segmentstore" "-Dpravega.configurationFile=PRAVEGA_APP_HOME/conf/config.properties" "-Dlogback.configurationFile=PRAVEGA_APP_HOME/conf/logback.xml"

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

set CLASSPATH=%APP_HOME%\lib\pravega-segmentstore-server-host-0.9.0.jar;%APP_HOME%\lib\pravega-client-0.9.0.jar;%APP_HOME%\lib\pravega-shared-security-0.9.0.jar;%APP_HOME%\lib\pravega-shared-cluster-0.9.0.jar;%APP_HOME%\lib\pravega-segmentstore-storage-impl-0.9.0.jar;%APP_HOME%\lib\pravega-bindings-0.9.0.jar;%APP_HOME%\lib\pravega-segmentstore-server-0.9.0.jar;%APP_HOME%\lib\pravega-segmentstore-storage-0.9.0.jar;%APP_HOME%\lib\pravega-segmentstore-contracts-0.9.0.jar;%APP_HOME%\lib\pravega-shared-protocol-0.9.0.jar;%APP_HOME%\lib\pravega-shared-controller-api-0.9.0.jar;%APP_HOME%\lib\pravega-shared-metrics-0.9.0.jar;%APP_HOME%\lib\pravega-common_server-0.9.0.jar;%APP_HOME%\lib\pravega-common-0.9.0.jar;%APP_HOME%\lib\pravega-shared-authplugin-0.9.0.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\bookkeeper-server-4.11.1.jar;%APP_HOME%\lib\hadoop-common-3.3.0.jar;%APP_HOME%\lib\object-client-3.0.6.jar;%APP_HOME%\lib\micrometer-registry-influx-1.2.0.jar;%APP_HOME%\lib\bookkeeper-tools-framework-4.11.1.jar;%APP_HOME%\lib\bookkeeper-common-4.11.1.jar;%APP_HOME%\lib\bookkeeper-common-allocator-4.11.1.jar;%APP_HOME%\lib\bookkeeper-proto-4.11.1.jar;%APP_HOME%\lib\curator-recipes-4.2.0.jar;%APP_HOME%\lib\hadoop-auth-3.3.0.jar;%APP_HOME%\lib\curator-framework-4.0.1.jar;%APP_HOME%\lib\curator-client-4.2.0.jar;%APP_HOME%\lib\zookeeper-3.5.5.jar;%APP_HOME%\lib\http-server-4.11.1.jar;%APP_HOME%\lib\circe-checksum-4.11.1.nar;%APP_HOME%\lib\avro-1.7.7.jar;%APP_HOME%\lib\smart-client-2.1.1.jar;%APP_HOME%\lib\object-transform-1.1.0.jar;%APP_HOME%\lib\bookkeeper-stats-api-4.11.1.jar;%APP_HOME%\lib\cpu-affinity-4.11.1.nar;%APP_HOME%\lib\kerb-simplekdc-1.0.1.jar;%APP_HOME%\lib\kerb-client-1.0.1.jar;%APP_HOME%\lib\kerb-admin-1.0.1.jar;%APP_HOME%\lib\kerb-util-1.0.1.jar;%APP_HOME%\lib\token-provider-1.0.1.jar;%APP_HOME%\lib\kerb-server-1.0.1.jar;%APP_HOME%\lib\kerb-common-1.0.1.jar;%APP_HOME%\lib\kerb-crypto-1.0.1.jar;%APP_HOME%\lib\kerb-identity-1.0.1.jar;%APP_HOME%\lib\kerb-core-1.0.1.jar;%APP_HOME%\lib\kerby-pkix-1.0.1.jar;%APP_HOME%\lib\kerby-config-1.0.1.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\hadoop-hdfs-3.3.0.jar;%APP_HOME%\lib\commons-io-2.6.jar;%APP_HOME%\lib\guice-assistedinject-4.0.jar;%APP_HOME%\lib\guice-servlet-4.0.jar;%APP_HOME%\lib\guice-4.0.jar;%APP_HOME%\lib\grpc-protobuf-1.24.2.jar;%APP_HOME%\lib\grpc-stub-1.24.2.jar;%APP_HOME%\lib\grpc-auth-1.24.2.jar;%APP_HOME%\lib\grpc-netty-1.24.2.jar;%APP_HOME%\lib\grpc-core-1.24.2.jar;%APP_HOME%\lib\grpc-protobuf-lite-1.24.2.jar;%APP_HOME%\lib\grpc-api-1.24.2.jar;%APP_HOME%\lib\guava-28.2-jre.jar;%APP_HOME%\lib\jjwt-0.9.1.jar;%APP_HOME%\lib\jaxb-runtime-2.3.1.jar;%APP_HOME%\lib\jersey-json-1.19.jar;%APP_HOME%\lib\jaxb-impl-2.2.3-1.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\commons-text-1.4.jar;%APP_HOME%\lib\commons-lang3-3.7.jar;%APP_HOME%\lib\hadoop-hdfs-client-3.3.0.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\perfmark-api-0.19.0.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-2.10.0.jar;%APP_HOME%\lib\error_prone_annotations-2.3.4.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\netty-codec-http2-4.1.50.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.50.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.50.Final.jar;%APP_HOME%\lib\netty-handler-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.50.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-codec-socks-4.1.50.Final.jar;%APP_HOME%\lib\netty-codec-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-4.1.50.Final.jar;%APP_HOME%\lib\jackson-databind-2.9.10.6.jar;%APP_HOME%\lib\txw2-2.3.1.jar;%APP_HOME%\lib\istack-commons-runtime-3.0.7.jar;%APP_HOME%\lib\stax-ex-1.8.jar;%APP_HOME%\lib\FastInfoset-1.2.15.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.30.Final.jar;%APP_HOME%\lib\micrometer-registry-statsd-1.2.0.jar;%APP_HOME%\lib\micrometer-core-1.2.0.jar;%APP_HOME%\lib\rocksdbjni-6.10.2.jar;%APP_HOME%\lib\commons-cli-1.2.jar;%APP_HOME%\lib\jersey-apache-client4-1.19.3.jar;%APP_HOME%\lib\httpclient-4.5.6.jar;%APP_HOME%\lib\commons-codec-1.11.jar;%APP_HOME%\lib\commons-collections4-4.1.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.60.jar;%APP_HOME%\lib\bcprov-ext-jdk15on-1.60.jar;%APP_HOME%\lib\jcommander-1.48.jar;%APP_HOME%\lib\jna-3.2.7.jar;%APP_HOME%\lib\commons-configuration-1.10.jar;%APP_HOME%\lib\hadoop-shaded-protobuf_3_7-1.0.0.jar;%APP_HOME%\lib\hadoop-annotations-3.3.0.jar;%APP_HOME%\lib\commons-math3-3.1.1.jar;%APP_HOME%\lib\commons-net-3.6.jar;%APP_HOME%\lib\commons-beanutils-1.9.4.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\jetty-webapp-9.4.20.v20190813.jar;%APP_HOME%\lib\jetty-servlet-9.4.20.v20190813.jar;%APP_HOME%\lib\jetty-security-9.4.20.v20190813.jar;%APP_HOME%\lib\jetty-server-9.4.20.v20190813.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\jetty-util-ajax-9.4.20.v20190813.jar;%APP_HOME%\lib\jetty-http-9.4.20.v20190813.jar;%APP_HOME%\lib\jetty-io-9.4.20.v20190813.jar;%APP_HOME%\lib\jetty-xml-9.4.20.v20190813.jar;%APP_HOME%\lib\jetty-util-9.4.20.v20190813.jar;%APP_HOME%\lib\jsp-api-2.1.jar;%APP_HOME%\lib\jersey-servlet-1.19.jar;%APP_HOME%\lib\jersey-server-1.19.jar;%APP_HOME%\lib\jersey-client-1.19.3.jar;%APP_HOME%\lib\jersey-core-1.19.3.jar;%APP_HOME%\lib\commons-configuration2-2.1.1.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\re2j-1.1.jar;%APP_HOME%\lib\protobuf-java-3.13.0.jar;%APP_HOME%\lib\gson-2.7.jar;%APP_HOME%\lib\jsch-0.1.55.jar;%APP_HOME%\lib\htrace-core4-4.1.0-incubating.jar;%APP_HOME%\lib\commons-compress-1.20.jar;%APP_HOME%\lib\woodstox-core-5.0.3.jar;%APP_HOME%\lib\stax2-api-3.1.4.jar;%APP_HOME%\lib\dnsjava-2.1.7.jar;%APP_HOME%\lib\commons-daemon-1.0.13.jar;%APP_HOME%\lib\leveldbjni-all-1.8.jar;%APP_HOME%\lib\okhttp-2.7.5.jar;%APP_HOME%\lib\jackson-annotations-2.11.0.jar;%APP_HOME%\lib\jdom2-2.0.6.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\netty-buffer-4.1.50.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.50.Final.jar;%APP_HOME%\lib\netty-common-4.1.50.Final.jar;%APP_HOME%\lib\jackson-core-2.11.0.jar;%APP_HOME%\lib\proto-google-common-protos-1.12.0.jar;%APP_HOME%\lib\google-auth-library-credentials-0.13.0.jar;%APP_HOME%\lib\HdrHistogram-2.1.11.jar;%APP_HOME%\lib\LatencyUtils-2.0.3.jar;%APP_HOME%\lib\jctools-core-2.1.2.jar;%APP_HOME%\lib\zookeeper-jute-3.5.5.jar;%APP_HOME%\lib\audience-annotations-0.5.0.jar;%APP_HOME%\lib\bcprov-jdk15on-1.60.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\httpcore-4.4.10.jar;%APP_HOME%\lib\javax.ws.rs-api-2.1.jar;%APP_HOME%\lib\jettison-1.1.jar;%APP_HOME%\lib\jackson-jaxrs-1.9.2.jar;%APP_HOME%\lib\jackson-xc-1.9.2.jar;%APP_HOME%\lib\jackson-mapper-asl-1.9.13.jar;%APP_HOME%\lib\jackson-core-asl-1.9.13.jar;%APP_HOME%\lib\paranamer-2.3.jar;%APP_HOME%\lib\snappy-java-1.0.5.jar;%APP_HOME%\lib\nimbus-jose-jwt-7.9.jar;%APP_HOME%\lib\json-smart-2.3.jar;%APP_HOME%\lib\okio-1.6.0.jar;%APP_HOME%\lib\lzma-sdk-4j-9.22.0.jar;%APP_HOME%\lib\annotations-4.1.1.4.jar;%APP_HOME%\lib\opencensus-contrib-grpc-metrics-0.21.0.jar;%APP_HOME%\lib\opencensus-api-0.21.0.jar;%APP_HOME%\lib\grpc-context-1.24.2.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.17.jar;%APP_HOME%\lib\jcip-annotations-1.0-1.jar;%APP_HOME%\lib\accessors-smart-1.2.jar;%APP_HOME%\lib\kerby-asn1-1.0.1.jar;%APP_HOME%\lib\kerby-util-1.0.1.jar;%APP_HOME%\lib\asm-5.0.4.jar;%APP_HOME%\lib\kerby-xdr-1.0.1.jar;%APP_HOME%\lib\pluginlib


@rem Execute pravega-segmentstore-withGCLogging
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %PRAVEGA_SEGMENTSTORE_WITH_GC_LOGGING_OPTS%  -classpath "%CLASSPATH%" io.pravega.controller.server.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable PRAVEGA_SEGMENTSTORE_WITH_GC_LOGGING_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%PRAVEGA_SEGMENTSTORE_WITH_GC_LOGGING_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
