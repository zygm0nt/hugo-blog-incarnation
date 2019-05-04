

How to install older version of Hugo o Mac?

```
Then I tried to see if there was an official way to downgrade my version. There are release tags on GitHub for the official Hugo repo which I downloaded but wasn’t sure how to install these properly as I had previously installed Hugo with brew.

So after a little digging I found out you can install with brew from older versions of homebrew-core package urls. You can track down the version you want and install it yourself by doing the following:

Search for the package you want in homebrew-core. In my case Hugo

Then click the ‘history’ button

Scroll down to find the version you want

Press the angle brackets button to view the file at that point in time. < >

View the raw file

Copy that url and use it with brew install

For example, this is what I’m currently using to brew install version v0.18.1 of Hugo:

brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/d3c4aadfd067534a723f9cf2e5c5bec444d0579d/Formula/hugo.rb
After that you’ll need to be careful not to accidentally upgrade your version when doing brew updates. Assuming you’ve switched to the version you want, the easiest way to do this is to pin that version with brew pin hugo.

Hopefully other folks using Hugo or other outdated brews will find this useful!

```
