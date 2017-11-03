Rails.application.routes.draw do
get '/' => 'main#register'

get 'login' => 'main#login'
post 'login'=> 'main#login'

get 'logged_in' => 'main#logged_in'
post 'logged_in' => 'main#logged_in'

get 'logout' => 'main#logout'
post 'logout' => 'main#logout'
end
