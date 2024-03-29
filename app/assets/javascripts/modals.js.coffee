$.rails.allowAction = (element) ->
  # The message is something like "Are you sure?"
  message = element.data('confirm')
  # If there's no message, there's no data-confirm attribute,
  # which means there's nothing to confirm
  return true unless message
  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
  $link = element.clone()
  # We don't necessarily want the same styling as the original link/button.
  .removeAttr('class')
  # We don't want to pop up another confirmation (recursion)
  .removeAttr('data-confirm')
  # We want a button
  .addClass('btn').addClass('btn-danger').addClass('btn-round')
  # We want it to sound confirmy
  .html("Yes, I'm positively certain.")

  # Create the modal box with the message
  modal_html = """
                    <div class="modal fade" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class='light'>#{message}</h3>
                          </div>
                          <div class="modal-body">
                            <p>This will be impossible to retrieve later .</p>
                          </div>
                          <div class="modal-footer">
                            <a data-dismiss="modal" class="btn">Cancel</a>
                          </div>
                        </div>
                      </div>
                    </div>
                   """
  $modal_html = $(modal_html)
  # Add the new button to the modal box
  $modal_html.find('.modal-footer').append($link)
  # Pop it up
  $modal_html.modal()
  # Prevent the original link from working
  return false

