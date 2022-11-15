module CardSummaryHelper
  def summary_online(onlines, total)
    @title = t('pages.home.card.online.title')
    @summary = t('pages.home.card.online.summary', onlines: onlines, total: total)
    @color = :primary
    @icon = :online
    summary_body
  end

  def summary_common_channel(total)
    @title = t('pages.home.card.channel.common')
    @summary = total
    @color = :info
    @icon = :common
    summary_body
  end

  def summary_personal_channel(total)
    @title = t('pages.home.card.channel.personal')
    @summary = total
    @color = :warning
    @icon = :personal
    summary_body
  end

  def summary_participating(total)
    @title = t('pages.home.card.channel.participating')
    @summary = total
    @color = :danger
    @icon = :collection
    summary_body
  end

  private

  def summary_body
    content_tag :div, class: card_class do
      content_tag :div, class: 'card-body' do
        content_tag :div, class: 'row no-gutters align-items-center' do
          card_body_left + card_body_right
        end
      end
    end
  end

  def card_body_left
    content_tag :div, class: 'col me-2' do
      card_body_title + card_body_summary
    end
  end

  def card_body_title
    content_tag :div, @title, class: body_class
  end

  def card_body_summary
    content_tag :div, @summary, class: 'h5 mb-0 fw-bold text-secondary'
  end

  def card_body_right
    content_tag :div, class: 'col-auto' do
      content_tag :i, class: card_icon_class do              
      end
    end
  end

  def card_icon_class
    class_names(
      {
        'bi': true,
        'bi-chat-dots-fill': @icon == :online,
        'bi-unlock-fill': @icon == :common,
        'bi-incognito': @icon == :personal,
        'bi-collection-fill': @icon == :collection,
        'text-secondary': true,
        'fs-1': true
      }
    )
  end

  def card_class
    class_names(
      {
        card: true,
        border: true,
        'border-0': true,
        'border-start': true,
        'border-5': true,
        'border-primary': @color == :primary,
        'border-info': @color == :info,
        'border-warning': @color == :warning,
        'border-danger': @color == :danger,
        shadow: true,
        'h-100': true,
        'py-2': true
      }
    )
  end

  def body_class
    class_names(
      {
        'text-xs': true,
        'fw-bold': true,
        'text-primary': @color == :primary,
        'text-info': @color == :info,
        'text-warning': @color == :warning,
        'text-danger': @color == :danger,
        'text-uppercase': true,
        'mb-1': true
      }
    )
  end
end
