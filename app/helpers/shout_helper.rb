module ShoutHelper
  def shout_form_for(content_class)
    form_for(Shout.new(content_type: content_class)) do |form|
      form.fields_for(:content) do |content_form|
        yield content_form
      end +
        form.hidden_field(:content_type) +
        form.submit("Shout")
    end
  end

  def reshout_button(shout)
    if current_user.reshouted?(shout)
      button_to "Undo Reshout", unreshout_shout_path(shout),
        method: :delete
    else
      button_to "Reshout", reshout_shout_path(shout),
        disabled: reshout_disabled?(shout)
    end
        #This wont work bc the form will have the wrong values int he hidden field
        # shout: {
        #   content_type: "ReShout", 
        #   content: { shout_id: shout.id}
        # }
      # }
  end

  private

  def reshout_disabled?(shout)
    current_user.owns?(shout)
  end
end
