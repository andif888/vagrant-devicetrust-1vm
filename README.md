# vagrant deviceTRUST 1VM

this repo provisions a single VM test environment for deviceTRUST (https://devicetrust.de/) using Vagrant und VirtualBox including **deviceTRUST's Demo Tool** to easily demonstrate pre-configured use-cases.   
Check out the **[Video on Youtube](https://youtu.be/yx2UItwv0-k)** to get an idea.  

It spins up the following VMs:

- Windows Server

## Requirements
You need a decent notebook or PC with a good amount of RAM (8 GB or more is recommended). 
It doesn't matter if it's Windows, MacOS or Linux. Ensure that VirtualBox and Vagrant is installed. 
To install VirtualBox please checkout https://www.virtualbox.org/wiki/Downloads 
To install Vargant please checkout https://www.vagrantup.com/downloads.html

## Using this repo

Clone the repo using (or download the repo as ZIP file and extract it somewhere on your harddrive)
```
git clone https://github.com/andif888/vagrant-devicetrust-1vm
```

after cloning the repo, change to the local directory using
```
cd vagrant-devicetrust
```

to run the test environment run
```
vagrant up
```

now be patient, it will take a while. 
Dependent on your internet connection speed it will take some time to download the Windows base images for the first time.  
Sub sequent runs will start much faster.

to stop the test environment run
```
vagrant halt
```

to destroy and cleanup the test environment, run
```
vagrant destroy
```

## Logon credentials

The VM has also the default vagrant credentials for the local user:  
### Pre-configured Local Admin User Accounts  

Username: vagrant  
Password: vagrant  

Username: Administrator  
Password: vagrant

### Pre-configured Local User Accounts
Username: user1  
Password: vagrant  


## Evaluation License

If the built in license has expired, you need a new evaluation license for deviceTRUST. To request one, please contact [deviceTRUST](https://devicetrust.com) directly.  
To watch out for license expiry please check **windows eventlog** for event id `15` in `Application and Service Logs` -> `deviceTRUST` -> `Admin`

To configure the evaluation license, open **Local Group Policy** Editor and locate `Computer Configuration` -> `deviceTRUST Console`.    
Go to `Settings` and find `Licensing` to enter the license string. 
