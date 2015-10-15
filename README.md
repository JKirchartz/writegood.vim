# Writegooder.vim

Writegooder is a plugin to highlight common writing problems, forked from
[davidbeckingsale's writegood.vim](https://github.com/davidbeckingsale/writegood.vim)

The plugin uses the `Error` group to highlight errors, so I assume it will work
on both gvim and terminal vim.

## Features
* Detects duplicate words (even over newlines)
* Highlights use of passive voice
* Highlights common "weasel words" 

<!---
## Screenshot

![Writegood mode in action](https://github.com/davidbeckingsale/writegood.vim/raw/master/writegood.png)
--->

## About

After reading Matt Might's blog post years ago, I was going to convert it to a 
git presubmit, but that seemed foolish since I was writing in vim; so once I 
found Dave Beckingsale's WriteGood I started using it -- then I noticed it was 
missing adjectives; instead of just adding them and submitting a pull request, 
I've decided I may need to add _more functionality_ for it to work the best with 
the way I think/write, so here we go!


### Links
* Matt Might's original [blog post](http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/)
* Benjamin Beckwiths [emacs minor-mode](https://github.com/bnbeckwith/writegood-mode)
* Steve Losh's [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)
* Nate Kane's [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)

### Credits
* Matt Might for writing the original scripts.
* Benjamin Beckwith for the emacs mode and catchy title I've borrowed.
* Steve Losh for 'Learn Vimscript the Hard Way'.
* Nathaniel Kane for the vim-indent-guides plugin, which I used as a
    reference for structuring and documentation.
* Dave Beckingsale who wrote the original version of this plugin (Twitter: @dabeckingsale)
    
### Contact  
* Twitter: @jkirchartz

