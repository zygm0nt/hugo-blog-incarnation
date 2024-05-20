
---
title: "Updating Confluence page from Markdown"
date: 2024-05-20T00:00:00Z
url: /2024/05/20/updating-confluence-page-from-markdown
draft: false
comments: true
categories:
    - it

---


![Image](/post_images/updating-confluence-page-from-markdown-0.png)

Prompt: generate an image for blogpost titled "Moving markdown files to confluence"

Assume you want to have your documentation close to the code. Ideally in your project's repo. But then there's always this request, that other people might want to look through that documentation, they're not too tech savy, no nothing about Git. 

A few past companies I've worked for have had their internal wikis built on Atlassian Confluence. It seems there's quite nice way to upload pages stored in repository to arbitrary location in Confluence.

Assuming you want to move Markdown files to Confluence pages, you can do the following:

```
pip install markdown-to-confluence

```
More info about this package can be found here: https://pypi.org/project/markdown-to-confluence/

Then,  in the CI of your choice:

```
export CONFLUENCE_DOMAIN='your-confluence-instance'  
export CONFLUENCE_PATH='/wiki/'  # should work, but change accordingly  
export CONFLUENCE_SPACE_KEY='YOUR-SPACE-KEY'   
export CONFLUENCE_USER_NAME=$CONFLUENCE_USER_NAME  
export CONFLUENCE_API_KEY=$CONFLUENCE_API_KEY  

python3 -m md2conf docs/some_sample.md --generated-by "This page is generated from markdown documentation in xyz/your-repo"  
```

This snippet uses some environment variables, `CONFLUENCE_USER_NAME`, `CONFLUENCE_API_KEY` - so just add them when accordingly.

Also, each markdown file needs to have a reference page in its header - this will be the page contents replaced by the markdown contents:

```
<!-- confluence-page-id: 3765011024 -->

### some markdown header

.... Contents of the file

```

And that's basically it! 