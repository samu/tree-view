module.exports =
class AutoHide
  constructor: (@treeView) ->
    @invalidate()

  handleOpen: ->
    if @wasHiddenBeforeFocus
      @treeView.detach()

  rememberVisibility: ->
    @wasHiddenBeforeFocus = true unless @treeView.isVisible()

  handlesToggleFocus: ->
    if @wasHiddenBeforeFocus
      @treeView.detach()
      return true
    return false

  invalidate: ->
    @wasHiddenBeforeFocus = false
