$ ->
  Nreduce.Views.WeeklyClass = Backbone.View.extend(
    el: '#app #weekly_class'
    className: 'weekly_classes'
    template: JST['backbone/templates/weekly_class']

    initialize: (data = {}) ->
      # bind 'this' context
      _.bindAll(@, 'render')

      # Initialize model
      @model = new Nreduce.Models.WeeklyClass(Nreduce.Data.weekly_class)
      @user = new Nreduce.Models.User(Nreduce.Data.user)
      @startup = new Nreduce.Models.Startup(Nreduce.Data.startup)

      @model.view = @ if @model?

      qs = new Nreduce.Collections.Questions(Nreduce.Data.questions)
      @questionView = new Nreduce.Views.Questions(collection: qs)

      @render()

    render: ->
      @.$el.html(@template(weekly_class: @model, user: @user, startup: @startup, questions: @questionView.collection))
  )