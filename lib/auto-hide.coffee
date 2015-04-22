class AutoHide
  constructor: (@treeView) ->
    @invalidate()

  handleOpen: ->
    if @wasHiddenBeforeFocus
      @treeView.detach()

  rememberVisibility: ->
    @wasHiddenBeforeFocus = yes unless @treeView.isVisible()

  handlesToggleFocus: ->
    if @wasHiddenBeforeFocus
      @treeView.detach()
      return yes
    return no

  invalidate: ->
    @wasHiddenBeforeFocus = no

class NoopAutoHide
  constructor: ->

  handleOpen: ->

  rememberVisibility: ->

  handlesToggleFocus: ->
    no

  invalidate: ->


module.exports = (autoHideEnabled, treeView) ->
  if autoHideEnabled
    return new AutoHide(treeView)

  return new NoopAutoHide()
