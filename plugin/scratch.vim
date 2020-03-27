if exists('g:loaded_scratch')
    finish
endif
let g:loaded_scratch = 1


function! ScratchEdit(cmd, options)
    exe a:cmd '[Scratch' . g:scratchbuf_no . ']'
    let g:scratchbuf_no += 1
    "setl buftype=nofile noswapfile bufhidden=hide buflisted
    Scratchify
    if !empty(a:options) | exe 'setl' a:options | endif
endfunction

command! Scratchify setlocal buflisted noswapfile buftype=nofile bufhidden=hide

command! -bar -nargs=* Scratch call ScratchEdit('edit', <q-args>)
command! -bar -nargs=* Scratchs call ScratchEdit('split', <q-args>)
command! -bar -nargs=* Scratchv call ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Scratcht call ScratchEdit('tabe', <q-args>)
