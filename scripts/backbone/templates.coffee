templates = {}

# thumbnail
template = '<div class="thumbnail"><img src="<%= src %>" alt="Snapshot" /></div>'
templates.snapshotView = _.template template

# saving
template = '<td><img src="<%= photo %>" class="img-circle" /></td><td><%- product %></td><td class="text-right"><%= amount %></td>'
templates.savingView = _.template template
