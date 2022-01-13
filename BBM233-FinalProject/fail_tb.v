
module fail_tb;
    reg clock;
    reg green;
    reg yellow;
    reg red;
    
    wire [2:0] state;
    
    wire a1;
    wire a2;
    wire a3;
    wire cheat_out;
    wire [5:0] timer;
    
    scp_079 UUT(.clock(clock), .green(green), .yellow(yellow), .red(red), 
     .a1(a1), .a2(a2), .a3(a3), .cheat_out(cheat_out), .timer(timer), .state(state));
 
    
    initial begin 
        clock = 0;#1;
        forever begin
             clock = ~clock;
             #0.5;
        end
    end
    
    
    initial begin
        green=1;yellow=0;red=0;
        #35;//0
        #6;//2
        green=0;yellow=0;red = 1; 
        #25;//1
        #10;//4
        $finish;
    end
    
endmodule
