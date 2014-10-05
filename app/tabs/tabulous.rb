Tabulous.setup do

  tabs do
    welcome_tab do
      text          { 'Welcome' }
      link_path     { root_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('welcome') }
    end

    posts_tab do
      text          { 'Blog' }
      link_path     { posts_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('posts') }
    end

    projects_tab do
      text          { 'Projects' }
      link_path     { projects_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('projects') }
    end

    messages_tab do
      text          { 'Contact' }
      link_path     { new_message_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('messages') }
    end
  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end
end
