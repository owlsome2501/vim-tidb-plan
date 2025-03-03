if exists('b:current_syntax') | finish | endif

syntax clear

syntax match tidbTreeSymbol /\v[└├─]+/
highlight link tidbTreeSymbol Comment

syntax match tidbOperator /\v([└├─]+\s+)*\S+_\d+\ze%(\s|\(|$)/
highlight link tidbOperator Function

syntax match tidbProbeBuild /(Probe)/
syntax match tidbProbeBuild /(Build)/
highlight link tidbProbeBuild Type

syntax match tidbRowCount /\v\d+\.?\d*\t\d+\.?\d*/ contains=tidbEstRows,tidbActRows
syntax match tidbEstRows /\v\d+\.?\d*/ contained nextgroup=tidbActRows
syntax match tidbActRows /\v\t\d+\.?\d*/ contained
highlight link tidbEstRows Number
highlight link tidbActRows Number

syntax match tidbTime /\vtime:\d+\.?\d*[µm]?s/ contains=tidbTimeLabel,tidbTimeValue
syntax match tidbTimeLabel /time:/ contained
syntax match tidbTimeValue /\v\d+\.?\d*[µm]?s/ contained
highlight link tidbTimeLabel Keyword
highlight link tidbTimeValue Number

syntax match tidbLoops /\vloops:\d+/ contains=tidbLoopsLabel,tidbLoopsValue
syntax match tidbLoopsLabel /loops:/ contained
syntax match tidbLoopsValue /\v\d+/ contained
highlight link tidbLoopsLabel Define
highlight link tidbLoopsValue Number

syntax match tidbRU /\vRU:\d+\.\d+/ contains=tidbRULabel,tidbRUValue
syntax match tidbRULabel /RU:/ contained
syntax match tidbRUValue /\d+\.\d+/ contained
highlight link tidbRULabel Keyword
highlight link tidbRUValue Float

syntax match tidbStorage /\v\d+\.?\d*\s+(KB|MB|GB|Bytes)/ contains=tidbStorageSize,tidbStorageUnit
syntax match tidbStorageSize /\v\d+\.?\d*/ contained
syntax match tidbStorageUnit /KB|MB|GB|Bytes/ contained
syntax match tidbNA /N\/A/
highlight link tidbStorageSize Number
highlight link tidbStorageUnit StorageClass
highlight link tidbNA Comment

syntax match tidbPath /\v\w+(\.\w+)+/
highlight link tidbPath Structure

let b:current_syntax = 'tidbplan'
