# CS9053_Project
Wenxiang Yu / Wentao Zhu

## java_server

<p align="center">
<a href="http://www.oracle.com/technetwork/java/javase/overview/index.html"><img src="https://img.shields.io/badge/language-java%208.0-orange.svg"></a>
<a href="https://www.jetbrains.com/idea/"><img src="https://img.shields.io/badge/platform-jetbrains-66FF99.svg"></a>
<a href="http://www.eclipse.org/"><img src="https://img.shields.io/badge/platform-eclipse-46aae6.svg"></a>
<a href="http://projects.spring.io/spring-boot/"><img src="https://img.shields.io/badge/SpringBoot-1.5.2-990066.svg"></a>
<a href="http://spring.io/"><img src="https://img.shields.io/badge/spring-4.3.7-3300FF.svg"></a>
<a href="http://www.mybatis.org/mybatis-3/"><img src="https://img.shields.io/badge/mybatis-3.3.0-660000.svg"></a>
<img src="https://img.shields.io/badge/license-MIT%203.0-CC3333.svg">
<img src="https://img.shields.io/badge/release-1.0.0-brightgreen.svg">
</p>

This project is the code of the server and management platform of the campus o2o e-commerce project. It adopts the 'springboot mybatis' architecture and integrates rich functions such as SMS, push, payment and permission management.

## Update
- 2017-7-21 
>  
1. Solve the problem that the spring jar package is too old to run.
2. The project is updated to the springboot project, and the springboot version is 1.5.2
3. Support running under IntelliJ
##Main functions
|Function platform|
|------------|-----------------------------------|
|Push | [Aurora]（ https://www.jiguang.cn/ ) |
|SMS | [mob]（ http://www.mob.com/ )      |
|Payment [Ping + +]（ https://www.pingxx.com/ )|
|Interface signature | --|
|Web side data management | [bootstrap table]（ http://bootstrap-table.wenzhixin.net.cn/zh-cn/ )|
|Permission management --|
|Multi campus management --|

## Run
The code from clone supports running under eclipse or IntelliJ, MySQL supports, and local support starts in the way of springboot.
1. Put the project root directory into foryou Import SQL into your own database.
2. Application Properties to modify the database connection configuration.
3. Execute MVN package to make the project into war package and run it under Tomcat.
4. Or change POM XML, change the packaging mode to jar. After executing MVN package, run 'Java jar' in the jar package directory and the jar package path
```
<packaging>jar</packaging>
```
5. Local test and startup. Execute the main function in the portaitapplication to start the built-in Tomcat and enter the default login page of the management end.
6. Campus administrator account admin: 123456, general campus administrator account admin_ 1:123456。

## License
This project is based on [MIT]（ https://www.opensource.org/licenses/mit-license.php ）Open source agreement