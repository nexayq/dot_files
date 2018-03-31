
# Map :W to :w
atom.packages.onDidActivatePackage (pack) ->
  if pack.name == 'ex-mode'
    Ex = pack.mainModule.provideEx()
    Ex.registerAlias 'W', 'w'
    Ex.registerAlias 'WQ', 'wq'
    Ex.registerAlias 'Q', 'q'
