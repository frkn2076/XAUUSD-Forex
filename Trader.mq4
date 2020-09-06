//+------------------------------------------------------------------+
//|                                                       FURKAN.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
string mySymbol = "XAUUSD";
extern int firstOrderTicketNumber = 0;
extern int secondOrderTicketNumber = 0;
extern int thirdOrderTicketNumber = 0;
extern int fourthOrderTicketNumber = 0;
extern int fifthOrderTicketNumber = 0;
extern int sixthOrderTicketNumber = 0;
extern int seventhOrderTicketNumber = 0;
extern int eightthOrderTicketNumber = 0;
extern int ninethOrderTicketNumber = 0;
extern int tenthOrderTicketNumber = 0;
extern int sellTicketNumber = 0;
extern int sellTicketNumber2 = 0;
extern int sellTicketNumber3 = 0;
extern int sellTicketNumber4 = 0;
extern int sellTicketNumber5 = 0;
extern int sellTicketNumber6 = 0;
extern int sellTicketNumber7 = 0;
extern int sellTicketNumber8 = 0;
extern int sellTicketNumber9 = 0;
extern int sellTicketNumber10 = 0;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(5);

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---

   double averagePriceOfLastWeek = iMA(mySymbol, PERIOD_D1, 7, 0, MODE_SMA, PRICE_CLOSE, 0);
   
   double maxPriceOfLastWeek = 0;
   double day1 = iHigh(mySymbol, PERIOD_D1,0);
   double day2 = iHigh(mySymbol, PERIOD_D1,1);
   double day3 = iHigh(mySymbol, PERIOD_D1,2);
   double day4 = iHigh(mySymbol, PERIOD_D1,3);
   double day5 = iHigh(mySymbol, PERIOD_D1,4);
   double day6 = iHigh(mySymbol, PERIOD_D1,5);
   double day7 = iHigh(mySymbol, PERIOD_D1,6);
   
   if(day1>day2){
      maxPriceOfLastWeek = day1;
   } 
   else {
      maxPriceOfLastWeek = day2;
   }
   
   if(day3>maxPriceOfLastWeek){
      maxPriceOfLastWeek = day3;
   }
   if(day4>maxPriceOfLastWeek){
      maxPriceOfLastWeek = day4;
   }
   if(day5>maxPriceOfLastWeek){
      maxPriceOfLastWeek = day5;
   }
   if(day6>maxPriceOfLastWeek){
      maxPriceOfLastWeek = day6;
   }

   double currentBuyPrice = MarketInfo(mySymbol, MODE_ASK); //1802.510
   double currentSellPrice = MarketInfo(mySymbol, MODE_BID); //1802.060

   

   Alert("Price:", DoubleToStr(currentBuyPrice,2),
         " AverageOfWeek:", DoubleToStr(averagePriceOfLastWeek,2),
         " MaxOfWeek:", DoubleToStr(maxPriceOfLastWeek,2)
        );
   
   if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES)==false){
      firstOrderTicketNumber = 0;
      secondOrderTicketNumber = 0;
      thirdOrderTicketNumber = 0;
      fourthOrderTicketNumber = 0;
      fifthOrderTicketNumber = 0;
      sixthOrderTicketNumber = 0;
      seventhOrderTicketNumber = 0;
      eightthOrderTicketNumber = 0;
      ninethOrderTicketNumber = 0;
      tenthOrderTicketNumber = 0;
      sellTicketNumber = 0;
      sellTicketNumber2 = 0;
      sellTicketNumber3 = 0;
      sellTicketNumber4 = 0;
      sellTicketNumber5 = 0;
      sellTicketNumber6 = 0;
      sellTicketNumber7 = 0;
      sellTicketNumber8 = 0;
      sellTicketNumber9 = 0;
      sellTicketNumber10 = 0;
   }
   
   if(OrdersTotal()==0){
      if(currentBuyPrice<averagePriceOfLastWeek-100*_Point)
        {
         firstOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+60*_Point, NULL, 0, 0, Green);
         Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
        }
      if(currentBuyPrice>maxPriceOfLastWeek-100*_Point){
         sellTicketNumber = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-400*_Point,NULL,0,0,Green );
      }
   }
   
   if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES)==true)
   {
    if(OrderType()==OP_BUY){   
      
      if(OrdersTotal()==1){
	      if(OrderSelect(firstOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					secondOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+160*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==2){
			if(OrderSelect(secondOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					thirdOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+260*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==3){
			if(OrderSelect(thirdOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					fourthOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+360*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==4){
			if(OrderSelect(fourthOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					fifthOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+460*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==5){
			if(OrderSelect(fifthOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					sixthOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+560*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==6){
			if(OrderSelect(sixthOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					seventhOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+660*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==7){
			if(OrderSelect(seventhOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					eightthOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+760*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==8){
			if(OrderSelect(eightthOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					ninethOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+860*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
		
		if(OrdersTotal()==9){
			if(OrderSelect(ninethOrderTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice<OrderOpenPrice()-100*_Point){
					tenthOrderTicketNumber = OrderSend(mySymbol, OP_BUY, 0.02, Ask, 3, 0, Ask+960*_Point, NULL, 0, 0, Green);
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		}
     }
     
     
     else if(OrderType()==OP_SELL){
     
       if(OrdersTotal()==1){
	      if(OrderSelect(sellTicketNumber, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber2 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-500*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
		 
		 if(OrdersTotal()==2){
	      if(OrderSelect(sellTicketNumber2, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber3 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-600*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
		 
		 if(OrdersTotal()==3){
	      if(OrderSelect(sellTicketNumber3, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber4 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-700*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
		 
		 if(OrdersTotal()==4){
	      if(OrderSelect(sellTicketNumber4, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber5 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-800*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
       
       if(OrdersTotal()==5){
	      if(OrderSelect(sellTicketNumber5, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber6 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-900*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
     
       if(OrdersTotal()==6){
	      if(OrderSelect(sellTicketNumber6, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber7 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-1000*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
     
       if(OrdersTotal()==7){
	      if(OrderSelect(sellTicketNumber7, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber8 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-1100*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
     
       if(OrdersTotal()==8){
	      if(OrderSelect(sellTicketNumber8, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber9 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-1200*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
     
       if(OrdersTotal()==9){
	      if(OrderSelect(sellTicketNumber9, SELECT_BY_TICKET, MODE_TRADES)==true){
				if(currentBuyPrice>OrderOpenPrice()+100*_Point){
					sellTicketNumber10 = OrderSend(mySymbol, OP_SELL, 0.02, Bid, 3, 0, Bid-1300*_Point,NULL,0,0,Green );
					Alert("Alım:", DoubleToStr(currentBuyPrice,2), " Order count:", OrdersTotal());
				}
			}  
		 }
		 
     }
   }
   
  }
//+------------------------------------------------------------------+
