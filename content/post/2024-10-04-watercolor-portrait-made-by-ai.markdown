
---
title: "Watercolor portrait - made by AI"
date: 2024-10-04T00:00:00Z
url: /2024/10/04/watercolor-portrait-made-by-ai
draft: false
comments: true
categories:
    - it
    - ai
    - howto
---


![Image](/post_images/watercolor-portrait-made-by-ai-0.png)

This article is inspired by a post I've stumbled upon on LinkedIn, by [Guido Appenzeller](https://www.linkedin.com/posts/appenz_flux-is-incredibly-good-to-generate-profile-activity-7231716430889541632-0XL8)

Below you can find a reinterpretation of his post. With added details here, and there. The reason for that, is twofold - a) I really like the workflow, b) the original post is missing some details for a first-time user of those tools.

Flux is incredibly good to generate profile pictures, for example this Watercolor one. Below a quick tutorial how to do it. Total cost is ~$5. Uses [Hugging Face](https://www.linkedin.com/company/huggingface/) and [Replicate](https://www.linkedin.com/company/replicate/).  

## Prerequisites

### Photos 

You'll need a few pictures of you (~10 is ok, but the more the better), to train a base model on them. They should not have other people in it, best to keep the background clean. Create a zip archive with the photos. It will be needed later on.

### "Secret word"

... or a trigger word. Choose a really unique word, you can just generate anything random. The thing here is to not trip over a word that's been in the training set of the model. This is for model's recall of your face.

## Step-by-step guide

#### Huggingface:

1. Create a new model. Eg. `yourusername/flux-test-1` 
2. Go to the Flux dev model (https://huggingface.co/black-forest-labs/FLUX.1-dev) and accept the terms of service  
3. Get API token for HuggingFace. Set "Repository section" permissions for this token.

#### Replicate

Use Replicate to train the model. This will be `Flux.1 dev LoRA`.  The trainer page is https://replicate.com/ostris/flux-dev-lora-trainer/train

Set the following parameters:  
- New mode, name can be whatever (e.g. `flux-test-1`)  
- Files is the zip file of the photos of yourself  
- Trigger Word is what you picked above, eg. TOK
- Set autocaption prefix to "A photo of \<Trigger Word>", so for me "A photo of TOK"  
- `hf_repo_id `should be your HuggingFace model name. So something like `yourusername/flux-test-1`  
- `hf_token` is the API token we generated above. Usually starts with `hf_`  

Everything else leave defaults.  

Start the training. Depending on the number of photos used for the fine-tuneing process, it might take some time. For a zip of 10 files it takes about 25-30min.

## Generate the actual watercolor pictures

Using the fine-tuned version of the model, and combining it with a different LoRA

To get the watercolor effect, we will combine this with another LoRA:  
1. Go to https://replicate.com/lucataco/flux-dev-multi-lora 
2. For `hf_loras` delete the two LoRAs that are there by default. Instead add your LoRA on **HuggingFace** (e.g. `yourusername/flux-test-1`), and the Style LoRA, e.g `SebastianBodza/flux_lora_aquarel_watercolor`  
3. Prompt is "A portrait of \<Trigger Word\> in the style of AQUACOLTOK"  

`AQUACOLTOK` in this case is a trigger word for this specific LoRA.

This should generate a watercolor picture of you. 

## Some other interesting LoRA-s

- https://replicate.com/sebastianbodza/flux_lora_retro_linedrawing_style_v1 
- https://replicate.com/lucataco/flux-time100

## Glitches

- my generated pictures randomly show my watercolored face, or some animal - that's very strange. Playing with params, like inference steps, or guidance helps, but it's unintuitive for me.
- model fine-tuned today gives wastly different results then during my initial experiments in August
