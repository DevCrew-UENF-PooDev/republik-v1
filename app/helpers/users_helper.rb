module UsersHelper
  def friendship_buttons(user, current_user)
    case current_user.friend_status(user)
    when :friends
      button_to "Desfazer Amizade", send_friend_request_path(user), method: :post, remote: true, class: "btn", data: { turbo_stream: true }
    when :request_received
      button_to("Aceitar", send_friend_request_path(user, action_type: "accept"), method: :post, remote: true, class: "btn", data: { turbo_stream: true }) +
      button_to("Recusar", send_friend_request_path(user, action_type: "reject"), method: :post, remote: true, class: "btn", data: { turbo_stream: true })
    when :request_sent
      button_to "Cancelar Pedido", send_friend_request_path(user), method: :post, remote: true, class: "btn", data: { turbo_stream: true }
    when :not_friends
      button_to "Enviar Pedido", send_friend_request_path(user), method: :post, remote: true, class: "btn", data: { turbo_stream: true }
    end
  end

  def community_buttons(current_user, community)
    case community.participation_status(current_user)
    when :community_user
      button_to "Sair", join_comunidade_path(community), method: :post, remote: true, class: "btn", data: { turbo_stream: true }
    when :community_not_participate
      button_to "Entrar", join_comunidade_path(community), method: :post, remote: true, class: "btn", data: { turbo_stream: true }
    end
  end
end
