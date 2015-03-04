class StatusPageWidget

  pageId: null
  options:
    alwaysShow: false
    linkNewWindow: true
    updateInterval: 0
  page: null
  data: null
  div: null


  constructor: (pageId, options) ->
    # store pageId, options and create StatusPage object to access API
    @pageId = pageId
    @processOptions(options)
    @page = new StatusPage.page({ page : @pageId })
    # update page status
    @updateStatus()
    # set update internal
    if @options.updateInterval
      setInterval =>
        @updateStatus()
      , @options.updateInterval * 1000


  processOptions: (options) ->
    # check for valid options and store them
    if typeof options isnt 'object' then return
    for key, val of options
      @options[key] = val


  updateStatus: ->
    # get page status from api
    @page.status
      success: (data) =>
        # store status then create/update widget
        @data = data
        @updateDiv()


  updateDiv: ->
    # check for valid data from API
    if !@data or !@data.status then return
    # if system is operation and alwaysShow is off, return
    if @data.status.indicator is 'none' and !@options.alwaysShow
      # if widget exists, remove it
      if @div
        @div.remove()
        @div = null
      return
    # if widget hasn't been create yet, create it
    if !@div
      @div = document.createElement('div')
      @div.className = 'status-page-container'
      document.body.appendChild(@div)
    # set content of widget
    @div.innerHTML = '<a class="status-page-link status-page-indicator-' + @data.status.indicator + '" href="https://' + @pageId + '.statuspage.io/" target="' + (if @options.linkNewWindow is true then '_blank' else '_top') + '">' + @data.status.description + ' &rarr;</a>'
