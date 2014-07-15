
jQuery ($) ->
  
  if ('standalone' in window.navigator) and window.navigator.standalone
    $('body').css 'border-top-width', '15px'

  Backbone.$ = $
  
  new navView()
  
  savings = new Savings()
  
  new productformView
    collection: savings
    model: new savingModel()

  new modalSavingDoneView
    collection: savings

  # new Router()
  # Backbone.history.start()
