# GIT Cheatsheet

## Uploading to repository



**To add changes to a commit**

`$ git add <file>` **OR** use stage button in editor

![image](https://user-images.githubusercontent.com/20118856/148621774-85b32bd8-2872-4f7e-b9da-0ae03c07494f.png)


**To commit changes for a feature**

`$ git commit -m "Changed player animations"` **OR** use commit button in editor

![image](https://user-images.githubusercontent.com/20118856/148621906-64d1df5a-b569-4e83-b505-e364bcf1dbf1.png)


**To push changes from PC to Github:**

`$ git push -f <remote> <branch>`

`$ git push -f origin main`
###### *Hint:* 'Origin' is the name we gave our computer for the remote repository

<br>

## Downloading from repository

`$ git pull origin main`

<br>

## Initial setup

`$ git init`
###### *Hint:* Creates a local repository on your machine. Notice the hidden `.git` folder

`$ git remote add origin https://github.com/<username>/<repository>.git`
###### *Hint:* 'Origin' is now a shorthand for that remote repository link

<br>

## FAQ

#### How do I see if my local repository is the same as the remote one?
`$ git status` 
