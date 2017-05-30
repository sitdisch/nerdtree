"fixing gg in nerdtree 
call NERDTreeAddKeyMap({
    \ 'key': 'gg',
    \ 'callback': 'NERDTreeCustomGoToFirstLine',
    \ 'quickhelpText': 'fixing of standard gg',
    \ 'override': 1 })
function! NERDTreeCustomGoToFirstLine()
	:normal 1G
endfunction

"go commands
call NERDTreeAddKeyMap({
    \ 'key': 'go',
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeCustomOpenInVim1',
    \ 'quickhelpText': 'open a file and go to it in the current vim window',
    \ 'override': 1 })
function! NERDTreeCustomOpenInVim1(node)
    call a:node.open({'stay': 0, 'where': 'p', 'keepopen': 0})
endfunction
call NERDTreeAddKeyMap({
    \ 'key': 'go',
    \ 'scope': 'Bookmark',
    \ 'callback': 'NERDTreeCustomOpenInVim2',
    \ 'quickhelpText': 'open a Bookmark and go to it in the current nerdtree window',
    \ 'override': 1 })
function! NERDTreeCustomOpenInVim2(node)
		:normal 
endfunction

"o command
call NERDTreeAddKeyMap({
    \ 'key': 'o',
    \ 'scope': 'Node',
    \ 'callback': 'NERDTreeCustomOpenInVimStay',
    \ 'quickhelpText': 'open a file and do not go to it (stay in nerdtree)',
    \ 'override': 1 })
function! NERDTreeCustomOpenInVimStay(node)
    call a:node.open({'stay': 1, 'where': 'p', 'keepopen': 1})
endfunction

"gt command
call NERDTreeAddKeyMap({
    \ 'key': 'gt',
    \ 'scope': 'Node',
    \ 'callback': 'NERDTreeCustomOpenInVimTab',
    \ 'quickhelpText': 'open a file in a new tab and go to it',
    \ 'override': 1 })
function! NERDTreeCustomOpenInVimTab(node)
    call a:node.open({'stay': 0, 'where': 't', 'keepopen': 1})
endfunction

"t command
call NERDTreeAddKeyMap({
    \ 'key': 't',
    \ 'scope': 'Node',
    \ 'callback': 'NERDTreeCustomOpenInVimTabStay',
    \ 'quickhelpText': 'open a file in a new tab and do not go to it (stay in nerdtree)',
    \ 'override': 1 })
function! NERDTreeCustomOpenInVimTabStay(node)
    call a:node.open({'stay': 1, 'where': 't', 'keepopen': 1})
endfunction

"gsp command
call NERDTreeAddKeyMap({
    \ 'key': 'gsp',
    \ 'scope': 'Node',
    \ 'callback': 'NERDTreeCustomOpenInVimSp',
    \ 'quickhelpText': 'open a file in a horizontal split and go to it',
    \ 'override': 1 })
function! NERDTreeCustomOpenInVimSp(node)
    call a:node.open({'stay': 0, 'where': 'h', 'keepopen': 0})
		:normal J
endfunction

" za commands
call NERDTreeAddKeyMap({
    \ 'key': 'za', 
    \ 'scope': 'DirNode',
    \ 'callback': 'NERDTreeCustomOpenDirNode1',
    \ 'quickhelpText': 'open or close a directory',
    \ 'override': 1 })
function! NERDTreeCustomOpenDirNode1(node)
    call a:node.activate()
endfunction
call NERDTreeAddKeyMap({
    \ 'key': 'za', 
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeCustomOpenDirNode2',
    \ 'quickhelpText': 'close a directory form the inside',
    \ 'override': 1 })
function! NERDTreeCustomOpenDirNode2(node)
	  let parent = a:node.parent
    while g:NERDTreeCascadeOpenSingleChildDir && !parent.isRoot()
        let childNodes = parent.getVisibleChildren()
        if len(childNodes) == 1 && childNodes[0].path.isDirectory
            let parent = parent.parent
        else
            break
        endif
    endwhile
    if parent ==# {} || parent.isRoot()
        call nerdtree#echo("cannot close tree root")
    else
        call parent.close()
        call b:NERDTree.render()
        call parent.putCursorHere(0, 0)
    endif
endfunction

"
"EASYMOTION COMMANDS for nerdtree
"
"<space>go commands
call NERDTreeAddKeyMap({
    \ 'key': '<space>go', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVim',
    \ 'quickhelpText': 'open a file with easymotion and go to it ',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVim()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vgo", "t" )
endfunction

"<space>o command
call NERDTreeAddKeyMap({
    \ 'key': '<space>o', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVimStay',
    \ 'quickhelpText': 'open a file with esaymotion and do not go to it (stay in nerdtree)',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVimStay()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vo", "t" )
endfunction

"<space>gt command
call NERDTreeAddKeyMap({
    \ 'key': '<space>gt', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVimTab',
    \ 'quickhelpText': 'open a file in a new tab with easymotion and go to it',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVimTab()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vgt", "t" )
endfunction

"<space>t command
call NERDTreeAddKeyMap({
    \ 'key': '<space>t', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVimTabStay',
    \ 'quickhelpText': 'open a file in a new tab with easymotion and do not go to it (stay in nerdtree)',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVimTabStay()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vt", "t" )
endfunction

"<space>gsp command
call NERDTreeAddKeyMap({
    \ 'key': '<space>gsp', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVimSp',
    \ 'quickhelpText': 'open a file in a horizontal split with easymotion and go to it',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVimSp()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vgsp", "t" )
endfunction

"<space>sp command
call NERDTreeAddKeyMap({
    \ 'key': '<space>sp', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVimSpStay',
    \ 'quickhelpText': 'open a file in a horizontal split with easymotion and do not go to it (stay in nerdtree)',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVimSpStay()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vsp", "t" )
endfunction

"<space>gvs command
call NERDTreeAddKeyMap({
    \ 'key': '<space>gvs', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVimVs',
    \ 'quickhelpText': 'open a file in a vertical split with easymotion and go to it',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVimVs()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vgvs", "t" )
endfunction

"<space>vs command
call NERDTreeAddKeyMap({
    \ 'key': '<space>vs', 
    \ 'callback': 'NERDTreeCustomEasyOpenInVimVsStay',
    \ 'quickhelpText': 'open a file in a vertical split with easymotion and do not go to it (stay in nerdtree)' ,
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInVimVsStay()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vvs", "t" )
endfunction

"<space>wo command
call NERDTreeAddKeyMap({
    \ 'key': '<space>wo', 
    \ 'callback': 'NERDTreeCustomEasyOpenInWinStan',
    \ 'quickhelpText': 'open and focus a file with easymotion in the windows standard program',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenInWinStan()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vwo", "t" )
endfunction

"<space>wp command
call NERDTreeAddKeyMap({
    \ 'key': '<space>wp', 
    \ 'callback': 'NERDTreeCustomEasyOpenCopyPath',
    \ 'quickhelpText': 'copy the path from the node/file with easymotion',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenCopyPath()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vwp", "t" )
endfunction

"<space>wc command
call NERDTreeAddKeyMap({
    \ 'key': '<space>wc', 
    \ 'callback': 'NERDTreeCustomEasyOpenCopyNode',
    \ 'quickhelpText': 'copy the whole file/directory to somewhere with easymotion',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenCopyNode()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vwc", "t" )
endfunction

"<space>wa command
call NERDTreeAddKeyMap({
    \ 'key': '<space>wa', 
    \ 'callback': 'NERDTreeCustomEasyOpenAddRenameNode',
    \ 'quickhelpText': 'add a childnode or with \ at the end a folder',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenAddRenameNode()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vwa", "t" )
endfunction

"<space>wm command
call NERDTreeAddKeyMap({
    \ 'key': '<space>wm', 
    \ 'callback': 'NERDTreeCustomEasyOpenMoveNode',
    \ 'quickhelpText': 'move or rename a file/directory',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenMoveNode()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vwm", "t" )
endfunction

"<space>wd command
call NERDTreeAddKeyMap({
    \ 'key': '<space>wd', 
    \ 'callback': 'NERDTreeCustomEasyOpenDeleteNode',
    \ 'quickhelpText': 'delete something (move it to the Recycle_bin)',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenDeleteNode()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vwd", "t" )
endfunction

"<space>wf command
call NERDTreeAddKeyMap({
    \ 'key': '<space>wf', 
    \ 'callback': 'NERDTreeCustomEasyOpenFetchUrl',
    \ 'quickhelpText': 'put content of a url to the current cursor position',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenFetchUrl()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vwf", "t" )
endfunction

"<space>za command
call NERDTreeAddKeyMap({
    \ 'key': '<space>za', 
    \ 'callback': 'NERDTreeCustomEasyOpenDirNode',
    \ 'quickhelpText': 'open or close a directory with easymotion',
    \ 'override': 1 })
function! NERDTreeCustomEasyOpenDirNode()
		:normal V
		call EasyMotion#Sol(1,2) 
		call feedkeys( "Vza", "t" )
endfunction

