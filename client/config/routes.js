Router.configure({
 layoutTemplate: 'application'
})

Router.onAfterAction(function(){
  GAnalytics.pageview(this.path)
})

Router.map(function(){
  this.route('home', {
    path: '/'
  })
})
