# What is it?

It is a vagrant configuration which consists of:
  * two IPA servers
  * two IPA clients

It uses script to build, install and configure IPA on CentOS systems.

# How do I use it?

  * Install vagrant
  * Install vagrant libvirt plugin
  * Clone this repo
  * Start server machines and then clients

   ```vagrant up server1 server2 && vagrant up host1 host2```

  * Add these to your /etc/hosts (IPA uses redirect using fqdn hostname):

    ```
    192.168.34.34 ipa-server1.example.com 
    192.168.34.35 ipa-server2.example.com 
    192.168.34.101 ipa-host1.example.com
    192.168.34.102 ipa-host2.example.com


    ```

  * Connect to [https://192.168.34.34][https://192.168.34.34] using login **admin** with password **admin123**
  * Use ```vagrant ssh host1``` to connect to 1st client or use it's IP address
  * Try it out and have fun! :-)
