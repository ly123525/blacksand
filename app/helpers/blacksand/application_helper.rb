module Blacksand
  module ApplicationHelper

    def paginate objects, options = {}
      options.reverse_merge!(theme: 'twitter-bootstrap-3')

      super(objects, options)
    end

    def filed_options(f)
      filed_options = {}
      case f.object.field.field_type
        when 'date' then
          filed_options = {data: {provide: 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-language' => 'zh-CN', 'date-autoclose' => true}}
        when 'gallery' then
          filed_options = {multiple: true}
        when 'page' then
          filed_options = { class: 'test', data: {provide: 'select2'} }
      end
      return filed_options.merge({label: "#{f.object.field.description}", label_class: "#{'required' if f.object.field.required?}"})
    end

    def select_choices(f)
      if f.object.value.present?
        page = f.object.content
        [['无', ''], ["##{page.id} #{page.title}", f.object.value]]
      else
        [['无', '']]
      end
    end

    def set_page_options(hash)
      @_page_options ||= {}
      @_page_options.merge!(hash)
    end

    def page_options
      @_page_options || {}
    end

  end
end
