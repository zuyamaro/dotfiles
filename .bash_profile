# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
     . ~/.bashrc
	 fi

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/Soran/Downloads/cocos2d-x-3.0rc2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/bin/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/bin/apache-ant-1.9.3/bin
export PATH=$ANT_ROOT:$PATH

#JDKのホーム
#JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
#JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home
export JAVA_HOME
PATH=${JAVA_HOME}/bin:$PATH 
export PATH

#カテリナホーム
CATALINA_HOME=~/Documents/workspace/apache-tomcat-7.0.54
export CATALINA_HOME
PATH=${CATELINA_HOME}/bin:$PATH

AXIS2_HOME=~/Documents/workspace/axis2-1.6.2
export AXIS2_HOME
PATH=${AXIS2_HOME}/bin:$PATH

AXIS_LIB=~/Documents/workspace/axis2-1.6.2/lib
export AXIS_LIB
PATH=${AXIS_LIB}/bin:$PATH

export CLASSPATH=$CLASSPATH:.

export PATH="/usr/local/bin:$PATH"

#PATH for ORACLE
export ORACLE_HOME=/Users/Soran/Documents/WorkIsBoring/oracle/
export SQLPATH=$ORACLE_HOME/instantclient_12_1
export PATH=${SQLPATH}:$PATH

#PATH for ruby on rails
export PATH="$HOME/.rbenv/shims:$PATH"

# PATH for go
export PATH="$HOME/go/bin:$PATH"

# PATH for yarn
export PATH="$HOME/.yarn/bin:$PATH"
