# Development Environment and Linux Setup
## Getting Started
This playbook helps a user setup several items to create a new development environment on a Linux system.

To get started, run:
```bash
cd ap_workspace_setup
./setup.sh
``` 
and follow the program prompts. A temporary Ansible python virtual environment will be created for playbook execution and removed after successful completion of the playbook.

#### User Password
The user running this playbook must have sudo access. The playbook will use the user's password to perform sudo actions.

#### Passwordless Sudo
Answering yes will setup paswordless sudo for the user running the playbook. 

<b>Note:</b> This playbook may not complete successfully if the user does not have passwordless sudo and you choose not to enable passwordless sudo.
 
#### IntelliJ IDEA Community Edition
Answering yes will install the latest version of IntelliJ IDEA CE.

#### Customize GNOME
Answering yes will theme the GNOME Desktop using the dark theme, add a custom launcher dock, and other useful UI tweaks (according to the author).

#### Ansible
Answering yes will install Ansible and several Ansible python libraries into a python virtual environment in the user's home directory.

#### VIM
Answering yes will ensure that GNU VIM is installed and the default shell editor

#### Chrome
Answering yes will add the Google Chrome PPA or yum repository and install the latest version of Google Chrome.

#### Workspace Setup
Answering yes will create a new directory named "workspace" in the user's home directory, clone all of the user's repositories into the workspace, setup the user's ssh keys/configuration, and setup the user's .git configuration.

If you choose to setup a workspace, you must have a workspace skeleton stored as a git repository that can be cloned (you would almost certainly want this to be a private repository). You will be prompted for URL and credentials to clone this repository. An example of a correctly laid out workspace skel can be found at:

https://github.com/dinohead/workspace_skel

The following files are required in a workspace skel:

|name               |type     |notes|
|:------------------|:--------|:---|
|.gitconfig         |file     |Contains git configuration. The file must exist, but the contents may be blank if desired.|
|.git-credentials   |file     |Contains urlencoded git credentials as created by git-credential helper. The file must exist, but the contents may be blank if desired.|
|.ssh               |directory|A directory containing id_rsa, id_rsa.pub, config, authorized_keys, known_hosts, etc. This directory must exist, but it can be left empty if desired.|
|workspace          |directory|A directory structure and (optionally) files that you want to be in your workspace (ex: files that are not otherwise source controlled). This directory must exist, but it can be left empty if desired.
|git_repos.yml      |file     |A properly formatted pymgit git repos file. It is assumed that the permissions necessary to clone repositories described in this file will be setup via the ssh keys or git-credentials file imported above. This file is used to both clone all of your desired repositories and setup tags for Git Run. 

If you do not have such a repository pre-staged, it will not be possible to complete the workspace setup.

Check the out the following repository for more information on how pymgit clones multiple repositories and works with git-run:

https://github.com/watsonb/pymgit

#### Git-Run
Answering yes will install git-run. For more info on git-run checkout:

https://github.com/mixu/gr

## Requirements
- User must have sudo
- Internet connectivity

#### Required Roles
All required roles will be installed automatically when using the `setup.sh` install script.

|Role                    |Source                                                  |
|:-----------------------|:-------------------------------------------------------|
|ar_linux_ansible_venv   |https://github.com/dinohead/ar_linux_ansible_venv.git   |
|ar_linux_chrome         |https://github.com/dinohead/ar_linux_chrome.git         |
|ar_linux_customize_gnome|https://github.com/dinohead/ar_linux_customize_gnome.git|
|ar_linux_intellij       |https://github.com/dinohead/ar_linux_intellij.git       |
|ar_linux_vim            |https://github.com/dinohead/ar_linux_vim.git            |

## Author Information

|Author              |E-mail                   |
|:-------------------|:------------------------|
|Derek 'dRock' Halsey|derek.halsey@dinohead.com|

## License

MIT License

Copyright (c) 2019 Dinohead LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
