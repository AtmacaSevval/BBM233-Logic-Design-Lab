module scp_079(
    input clock,
    input green,
    input yellow,
    input red, 
    
    output reg [2:0] state,
    output reg [5:0] timer ,
    output reg a1,
    output reg a2, 
    output reg a3, 
    output reg cheat_out
    
    );
    /* a1:attack security output  a2:attack database output  a3:control system output*/
    
    reg [2:0] next_state;
    
    reg cur_a1 = 0;
    reg cur_a2 = 0;
    reg cur_a3 = 0;
    reg cur_cheat = 0;
    /* I created "cur outputs" to change to outputs in correct time.*/
    
    parameter s0= 3'b000, s1 = 3'b001, s2 = 3'b010, 
                s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;
                /*s0:lay low   s1:cheat state  s2:attack security   s3:attack database   s4:fail   s5:connect*/
            
                
    always @(posedge clock) // always block to update state
        begin
                state <= next_state;
                timer <= timer + 1; 
                
                a1 = cur_a1;
                a2 = cur_a2;
                a3 = cur_a3;
                cheat_out = cur_cheat;
        end 
            
        
            
           
    always @(state, red, green, yellow, timer)begin
        $display(state, red, green, yellow, timer , a1, a2, a3);
        case(state)
            
            s0 : 
            if(green == 1 & yellow == 0 & red == 0 & timer >= 6'b100011)begin next_state = s2; cur_a1 = 1; timer = 0;end
            else if(red == 1) begin next_state = s1; cur_cheat = 1; timer = 0; end
            else if(yellow == 1) begin next_state = s0; end
            
            s1 :
            if(red == 1 & timer >= 6'b011001)begin next_state = s4; timer = 0;end
            else if( red != 1 & timer >= 6'b011001) begin next_state = s0; cur_a1 = 0; cur_a2 = 0; cur_a3 = 0; cur_cheat = 0; timer = 0;end
            
            s2 :
            if(yellow == 1 & red == 0)begin next_state = s0; cur_a1 = 0; timer = 0;end 
            else if(green == 1 & yellow == 0 & red == 0 & timer >= 6'b010100)begin next_state = s3; cur_a2 = 1; timer = 0;end
            else if(red == 1)begin next_state = s1; cur_cheat = 1;  timer = 0;end
            
            s3 :
            if(green == 1 & yellow == 0 & red == 0 & timer >= 6'b001001)begin next_state = s5; cur_a3 = 1; timer = 0;end
            else if(red == 1) begin next_state = s1; cur_cheat = 1; timer = 0; end
            else if(yellow == 1 & red == 0) begin next_state = s2; cur_a2 = 0; timer = 0; end
             
            s4:;
            s5:;
            
            default : begin next_state = s0 ;timer = 1; state = 3'b000; a1 = 0; a2 = 0; a3 = 0; cheat_out = 0;end
        endcase
    end
endmodule





