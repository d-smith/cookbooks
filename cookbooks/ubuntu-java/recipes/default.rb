#
# Cookbook Name:: ubuntu-java
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "purge openjdk" do
	command "apt-get purge openjdk*"
end

execute "update cache" do
	command "apt-get update"
end

execute "add java repo" do
	command "add-apt-repository -y ppa:webupd8team/java"
end

execute "apt-get update" do
	command "apt-get update"
end

execute "install debconf utils" do
	command "apt-get install debconf-utils"
end

execute "accept license" do
	command "echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections"
end

execute "set oracle response to yes" do
	command "echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections"
end

execute "install java" do
	command "apt-get install -y oracle-java7-installer"
end
