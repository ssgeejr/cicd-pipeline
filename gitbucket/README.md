https://github.com/gitbucket/gitbucket



Pull war file: wget https://github.com/gitbucket/gitbucket/releases/download/4.27.0/gitbucket.war

docker run --name git --rm -p 8881:8080 -v /opt/cicd/gitbucket/data:/gitbucket -ti sprintbucketo

docker build -t sprintbucket .



Installation
GitBucket requires Java8. You have to install it, if it is not already installed.

Download the latest gitbucket.war from the releases page and run it by java -jar gitbucket.war.
Go to http://[hostname]:8080/ and log in with ID: root / Pass: root.
You can specify following options:

--port=[NUMBER]
--prefix=[CONTEXTPATH]
--host=[HOSTNAME]
--gitbucket.home=[DATA_DIR]
--temp_dir=[TEMP_DIR]
--max_file_size=[MAX_FILE_SIZE]

docker run -ti --name git --rm -p 8880:8080 -v /opt/cicd/gitbucket/data:/gitbucket sprintbucket
