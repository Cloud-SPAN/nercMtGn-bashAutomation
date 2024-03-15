---
title: "Logging onto the Cloud"
teaching: 30
exercises: 20
questions:
- How do I connect to an AWS instance?
objectives:
- Log onto to a running instance
- Log off from a running instance
keypoints:
- You log into an AWS instance using the ssh command
- The .pem file acts as a key to verify our identity to the Linux operating system in your AWS instance.
- Logging off an instance is not the same as turning off an instance
---

<script language="javascript" type="text/javascript">
function set_page_view_defaults() {
    document.getElementById('div_aws_win').style.display = 'block';
    document.getElementById('div_aws_unix').style.display = 'none';
};

function change_content_by_platform(form_control){
    if (!form_control || document.getElementById(form_control).value == 'aws_win') {
        set_page_view_defaults();
    } else if (document.getElementById(form_control).value == 'aws_unix') {
        document.getElementById('div_aws_win').style.display = 'none';
        document.getElementById('div_aws_unix').style.display = 'block';
        document.getElementById('div_hpc').style.display = 'none';
        document.getElementById('div_cyverse').style.display = 'none';
    } else {
        alert("Error: Missing platform value for 'change_content_by_platform()' script!");
    }
}

window.onload = set_page_view_defaults;
</script>

## Important Note

This lesson covers how to log into, and out of, an *already running* AWS instance.

## Background to AWS

An Amazon Web Services (AWS) instance is a **remote computer** that runs on AWS infrastructure and that is accessible from any laptop or desktop as described below. For this course, an AWS instance will have been created for you by the Cloud-SPAN team.

To login into your AWS instance for this course, you'll need:
- the name of your instance and a login key file, both of which you received via email
- the shell/terminal application --- **Windows users** should have already installed the *Git Bash* shell; otherwise follow the directions in the [Setup](../setup)
- the *secure shell* (**ssh**) application, which is readily available in MacOS, Linux and Windows. **Windows users** will use ssh through Git Bash. 

As the name implies, **ssh** provides you with a secure (encrypted) way to use a remote *shell*, as simple as this (you do not have to type this yet):

 ~~~
 $ ssh -i login-key-instanceNNN.pem csuser@instanceNNN.cloud-span.aws.york.ac.uk
 ~~~
 {: .bash}

A few seconds after you enter that command to the shell in your computer, you will be logged into your AWS instance and start using a (Linux) shell running in your instance.

## Open a Terminal and change the access permissions of your login key file

1. **Open the *cloudspan* folder you created for the course**

    Open your file manager and navigate to the `cloudspan` folder (hint: we recommended you make the folder in your *Desktop* directory - but you might have made it somewhere else). If you cannot find the folder, you can remind yourself where it is stored by looking at the absolute path you wrote down in the previous episode.

    The folder should contain the login key file we downloaded in the previous episode and nothing else.

2. **Right-click and open your machine's command line interface**

    Now we can open the command line.

    For Windows users:

    - Right click anywhere inside the blank space of the file manager, then select **Git Bash Here**.
  
    For Mac users:

    You have two options. 
    
    EITHER
    - Open **Terminal** in one window and type `cd` followed by a space. Do not press enter! Now open **Finder** in another window. Drag and drop the `cloudspan` folder from the Finder to the Terminal. You should see the file path leading to your `cloudspan` folder appear. Now press enter to navigate to the folder.

    OR
    - Open **Terminal** and type `cd` followed by the absolute path that leads to your `cloudspan` folder. Press enter.  
    
    A new window will open - this is your command line interface, also known as the shell or the terminal. Once the terminal opens, it will display/output the **command prompt** to signal that it is ready to accept commands (instructions). The **command prompt** is 1 or 2 lines depending on your operating system (Windows, Linux, MacOS) and will be similar to the following.

    Typical command prompt for Windows Git Bash users:

    ~~~
    username@machineid MINGW64 ~
    $
    ~~~
    {: .output}

    Obviously "username" and "machineid" in the Output box above will be different when you open a terminal and will correspond to the actual username and the name of the machine you are using. 

    The character `$` is the typical ending of user prompts (the ending of admin users prompts is typically `#`). Commands you type will follow the `$`.
    

    Typical command prompt for Linux users:

    ~~~
    username@machineid:~ $
    ~~~
    {: .output}

    Typical command prompt for MacOS users:

    ~~~
    machineid:~ username $
    ~~~
    {: .output}
    
    In the rest of this course we will show only the `$` to represent the prompt. 

3. **Check that you are in the right folder**

    The terminal should have automatically set our `cloudspan` folder as the current working directory. This is because we asked the terminal to open from a specific location.

    You can check if the working directory is set correctly by looking at the file path which is defined to the left of your command prompt (`$`). It should display the second half of the absolute path we wrote down previously, usually starting after your computer's username, and always ending in `/cloudspan`.

    You can also check by typing the letters `ls` after the command prompt and pressing enter. This will list all the files in the working directory AKA all files in the `cloudspan` folder. In our case, this should be just one file, the login key ending in `.pem`.

4. **Change the access permissions of your login key file**

    Enter the following command to change the access permissions of your file but **replace** NNN with the actual number in your file name:
    ~~~
    $ chmod 400 login-key-instanceNNN.pem 
    ~~~
    {: .bash}

    The command `chmod` (change access mode) makes your login key file accessible to you only (and non-accessible to any other potential users of your computer), a condition that is required and checked by the program `ssh` that you will use next to login to your AWS instance. You will learn about file access permissions later in the course.

## Login into your instance with ssh

1. Copy and paste the command in the Code box below to your *terminal*, but **replace** `NNN` with the number in your login key file name.

    Windows Git Bash users only:
    - **copy** the command the usual Windows way: (1) highlight it with the mouse pointer while pressing the mouse left button and (2) press Ctrl-c (keys Ctrl and c simultaneously).
    - but **paste** it the Linux/Unix way: by pressing the mouse middle button while hovering the mouse pointer over the Git Bash window. (Try with the right button if the middle button doesn't work.) Alternatively, right click and select `paste`.

    ~~~
    $ ssh -i login-key-instanceNNN.pem  csuser@instanceNNN.cloud-span.aws.york.ac.uk
    ~~~
    {: .bash}

    *Be sure to replace* `NNN` *twice.* You can use the left and right arrow keys to move to where NNN is.

    The `-i` option tells `ssh` the identity file containing the key to send to your AWS instance for it to check that you have access permissions to connect as an *ssh client*. 

    **NB**: `ssh` looks for the identity file in the directory where you are, Desktop/cloudspan (that you moved to with the command `cd` above), which is the same directory wherein you downloaded your login key file.  


2. The terminal will display a security message, after you enter the `ssh` command, *similar* to the one below: 

    ~~~
    The authenticity of host 'instanceNNN-cloud-span.aws.york.ac.uk (52.211.132.120)' can't be established.ECDSA key fingerprint is SHA256:8N054prkkCeM4GCDSsa0AUnSQw5ngBQHbOR40FqfqLg.
    Are you sure you want to continue connecting (yes/no/[fingerprint])? 
    ~~~
    {: .output}

    Type **yes** to continue and get connected to your AWS instance.

    The terminal will display a few messages and at the end the **prompt** of the **shell running** on your Linux AWS instance:

    ~~~
    ...
    csuser@instanceNNN:~ $
    ~~~
    {: .output}

    Note that you did not need to give a password to login to your instance --- you are using your login-key file for authentication.

## Logging off your cloud instance

Logging off your instance is a lot like logging out of your local computer but it doesn't shut the computer off. **Be aware that AWS instances accrue charges whenever they are running, even if you are logged off**. Today, however, you do not need to worry about this!

To log off, use the `exit` command in the same terminal you connected with. This will close the connection, and your terminal will go back to showing your local computer prompt, for example:

~~~
csuser@instanceNNN:~ $ exit
~~~
{: .bash}
~~~
logout
Connection to instance05-gc.cloud-span.aws.york.ac.uk closed.
username@machineid $
~~~
{: .output}

## Subsequent logins to your AWS instance

To login back to your instance, open a terminal, make sure you are in your `cloudspan` folder and `ssh` as before:

~~~ 
$ ssh -i login-key-instanceNNN.pem  csuser@instanceNNN.cloud-span.aws.york.ac.uk
~~~
{: .bash}
