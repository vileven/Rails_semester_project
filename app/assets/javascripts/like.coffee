$(document).on 'ajax:success', 'a.vote', (status,data,xhr)->
# the `data` parameter is the decoded JSON object
  $(".votes-count[data-id=#{data.id}]").text data.count
  return