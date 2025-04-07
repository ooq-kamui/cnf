
" paste clp
"inoremap <c-v> <c-r>a

let g:fzf_rg_opt .= ' -g "!amplify/#current-cloud-backend/"'
let g:fzf_rg_opt .= ' -g "!amplify/backend/node_modules/"'
let g:fzf_rg_opt .= ' -g "!amplify/backend/awscloudformation/build"'

nnoremap P :Pth <cr>

" 
" plg
" 

" osc52

source ~/wrk/cnf/vim/plg/osc52.vim

nnoremap C :call C9clp__ynk()<cr>

func! C9clp__ynk() abort

  call SendViaOSC52(@a)

  " dev todo
  " call Sys_cmd('echo "aaa" | osc52.sh')
endfunc

func! Ynk__clp() abort

  if Is_env__('linux')

    "call Ynk__c9clp()

  else
    let @a = @+
  endif
endfunc

