if exists('g:loaded_searchhi') || &cp
    finish
endif
let g:loaded_searchhi = 1

if !exists('g:searchhi_user_autocmds_enabled')
    let g:searchhi_user_autocmds_enabled = 0
endif

if !exists('g:searchhi_clear_all_autocmds')
    let g:searchhi_clear_all_autocmds = ''
endif

if !exists('g:searchhi_update_all_autocmds')
    let g:searchhi_update_all_autocmds = ''
endif

if !exists('g:searchhi_clear_all_asap')
    let g:searchhi_clear_all_asap = 0
endif

if !exists('g:searchhi_open_folds')
    let g:searchhi_open_folds = 1
endif

if !exists('g:searchhi_visual_maps_enabled')
    let g:searchhi_visual_maps_enabled = 1
endif

if !exists('g:searchhi_cmdline_leave_time')
    let g:searchhi_cmdline_leave_time = 25
endif

if !exists('g:searchhi_redraw_before_on')
    let g:searchhi_redraw_before_on = 0
endif

if !exists('g:searchhi_cursor')
    let g:searchhi_cursor = 1
end

" Setting it to `Incsearch` works out surprisingly nicely
highlight default link CurrentSearch Incsearch

highlight default link SearchCursor Normal

let g:searchhi_status = ''
call searchhi#await()

noremap <silent> <Plug>(searchhi-listen)
    \ :<C-U>call searchhi#listen(0, 0)<CR>

noremap <silent> <Plug>(searchhi-await)
    \ :<C-U>call searchhi#await(0, 0)<CR>

noremap <silent> <Plug>(searchhi-update)
    \ :<C-U>call searchhi#update(0, 0)<CR>

noremap <silent> <Plug>(searchhi-clear)
    \ :<C-U>call searchhi#clear(0, 0)<CR>

" Convenience mappings

" These don't need to be used unless `g:searchhi_clear_all_asap` or
" `g:searchhi_clear_all_autocmds` are used in a such a way that hlsearch is
" still turned off when the next search is started {{{

noremap <silent> <Plug>(searchhi-pre-search)
    \ :<C-U>nohlsearch<CR>:<C-U>call searchhi#hlsearch(0, 0)<CR>

noremap <Plug>(searchhi-/)
    \ :<C-U>nohlsearch<CR>:<C-U>call searchhi#hlsearch(0, 0)<CR>/

noremap <Plug>(searchhi-?)
    \ :<C-U>nohlsearch<CR>:<C-U>call searchhi#hlsearch(0, 0)<CR>?

" }}}

map <silent> <Plug>(searchhi-clear-all)
    \ :<C-U>nohlsearch<CR><Plug>(searchhi-clear)<Plug>(searchhi-await)

noremap <silent> <Plug>(searchhi-n)
    \ n:<C-U>call searchhi#update(0, 0)<CR>

noremap <silent> <Plug>(searchhi-N)
    \ N:<C-U>call searchhi#update(0, 0)<CR>

if g:searchhi_clear_all_asap
    noremap <silent> <Plug>(searchhi-*)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>*
         \:<C-U>call searchhi#update(0, 0)<CR>

    noremap <silent> <Plug>(searchhi-g*)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>g*
         \:<C-U>call searchhi#update(0, 0)<CR>

    noremap <silent> <Plug>(searchhi-#)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>#
         \:<C-U>call searchhi#update(0, 0)<CR>

    noremap <silent> <Plug>(searchhi-g#)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>g#
         \:<C-U>call searchhi#update(0, 0)<CR>

    noremap <silent> <Plug>(searchhi-gd)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>gd
         \:<C-U>call searchhi#update(0, 0)<CR>

    noremap <silent> <Plug>(searchhi-gD)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>gD
         \:<C-U>call searchhi#update(0, 0)<CR>
else
    noremap <silent> <Plug>(searchhi-*)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>*

    noremap <silent> <Plug>(searchhi-g*)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>g*

    noremap <silent> <Plug>(searchhi-#)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>#

    noremap <silent> <Plug>(searchhi-g#)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>g#

    noremap <silent> <Plug>(searchhi-gd)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>gd

    noremap <silent> <Plug>(searchhi-gD)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(0, 0)<CR>gD
endif

if g:searchhi_visual_maps_enabled
    noremap <silent> <Plug>(searchhi-v-listen)
        \ :<C-U>call searchhi#listen(1, 0)<CR>

    noremap <silent> <Plug>(searchhi-v-await)
        \ :<C-U>call searchhi#await(1, 0)<CR>

    noremap <silent> <Plug>(searchhi-v-clear)
        \ :<C-U>call searchhi#clear(1, 0)<CR>

    noremap <silent> <Plug>(searchhi-v-update)
        \ :<C-U>call searchhi#update(1, 0)<CR>

    noremap <silent> <Plug>(searchhi-v-pre-search)
        \ :<C-U>nohlsearch<CR>:<C-U>call searchhi#hlsearch(1, 0)<CR>

    noremap <Plug>(searchhi-v-/)
        \ :<C-U>nohlsearch<CR>:<C-U>call searchhi#hlsearch(1, 0)<CR>/

    noremap <Plug>(searchhi-v-?)
        \ :<C-U>nohlsearch<CR>:<C-U>call searchhi#hlsearch(1, 0)<CR>?

    map <silent> <Plug>(searchhi-v-clear-all)
        \ :<C-U>nohlsearch<CR><Plug>(searchhi-clear)<Plug>(searchhi-v-await)

    noremap <silent> <Plug>(searchhi-v-n)
        \ n:<C-U>call searchhi#update(1, 0)<CR>

    noremap <silent> <Plug>(searchhi-v-N)
        \ N:<C-U>call searchhi#update(1, 0)<CR>

    noremap <silent> <Plug>(searchhi-v-*)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(1, 0)<CR>*

    noremap <silent> <Plug>(searchhi-v-g*)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(1, 0)<CR>g*

    noremap <silent> <Plug>(searchhi-v-#)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(1, 0)<CR>#

    noremap <silent> <Plug>(searchhi-v-g#)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(1, 0)<CR>g#

    noremap <silent> <Plug>(searchhi-v-gd)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(1, 0)<CR>gd

    noremap <silent> <Plug>(searchhi-v-gD)
        \ :<C-U>call searchhi#update(0, 0)<CR>
         \:<C-U>call searchhi#force_ignorecase(1, 0)<CR>gD
endif
