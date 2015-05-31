class window.CardView extends Backbone.View
  className: 'card'
  # the first one is the original. Name')later ones are attempts
  # template: _.template '<%= rankName %> of <%= suitName %>'
    # template: _.template '<img src= "<%= rankName %> - <%= suitName %>"/>'
  initialize: ->
     @render()

  render: ->
    rank = @model.attributes.rankName
    suit = @model.attributes.suitName

    imgNode = $("<img class='card'></img>")
    temp = "img/cards/" + rank.toString().toLowerCase() + "-" + suit.toLowerCase() + ".png"

    backTemp = "img/card-back.png"

    imgNode = imgNode.attr("src", temp)

    @$el.children().detach()

    if(@model.attributes.revealed)
      @$el.append(imgNode)
    else @$el.append(imgNode.attr("src", backTemp))
    @$el.addClass 'covered' unless @model.get 'revealed'

