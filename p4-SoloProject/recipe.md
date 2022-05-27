# Solo Project

Here is a project to test your golden square skills overall:

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of
that? How will you keep that information out of your repository?

# Class design

class Customer
  def initialize
    # takes no parameter
    @menu # array contains all ordered dishes (as dish objects)
  end

  def show_dishes
    # takes no argument
    # return menu, showing names with prices (each dish is an object?)
  end

  def order_meal(dish)
    # takes dish (dish object) as input
    # adds dish into the order(is it an array?)
    # returns nothing
  end

  def show_order
    # takes no argument
    # return all ordered meals with price (array? formatted text?)
  end

  def text_msg
    # not sure what it does 
    # needs twilio gem??
    # api related
  end
end


class Dish
  def initialize(name, price) #name is string; price is integer / float
    @name = name
    @price = price
  end

  def price
    @price
  end

  def name
    @name
  end
end