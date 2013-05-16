templates = {}

# thumbnail
template = '<div class="thumbnail"><img src="<%= src %>" alt="Snapshot" /></div>'
templates.snapshotView = _.template template

# saving
template = '<td><img src="<%= photo %>" class="img-circle" /></td><td><%- product %></td><td class="text-right"><%= amount %></td>'
templates.savingView = _.template template

# modalSavingDone
template = '<h3><%= cheer %></h3><p class="lead">Those <%= amount %> you just saved brings you to a total of <%= total %></p>'
templates.modalSavingDone = _.template template
