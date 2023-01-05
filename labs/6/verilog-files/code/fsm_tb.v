`timescale 1 ns / 10 ps
module fsm_tb();

reg clk;
reg i0, i1, i2, i3;
reg nrst;
integer next_state_err_cnt;
integer output_err_cnt;
integer total_test_cases;
wire o0, o1, o2;
wire [2:0] state_reg;

localparam PERIOD = 10;

fsm fsm1 (	clk, nrst, 
			i0, i1, i2, i3,
			o0, o1, o2,
			state_reg);
always
	#(PERIOD/2) clk = ~clk;

initial
begin
	next_state_err_cnt = 0;
	output_err_cnt = 0;
	total_test_cases = 0;
	nrst = 0;
	clk = 1;
	i0=0;
	i1=0;
	i2=0;
	i3=0;
	
	$display("Testing fsm:");
	
	#(3*PERIOD) nrst = 1;
	if(state_reg != 3'd0)
	begin
		$error("Error! Performed nrst but got state value: %d", state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd001)
	begin
		$error("After Reset: Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd001);
		output_err_cnt = output_err_cnt + 1;
	end
	
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b0111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd0;
	{i0, i1, i2, i3} = 4'b1111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 0, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd0)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 0, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd001)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd001);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd0)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 0, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd001)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd001);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b0111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd1;
	{i0, i1, i2, i3} = 4'b1111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 1, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b0111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd2;
	{i0, i1, i2, i3} = 4'b1111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 2, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd0)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 0, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd001)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd001);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd2)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 2, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd100)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd100);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b0111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd0)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 0, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd001)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd001);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd3;
	{i0, i1, i2, i3} = 4'b1111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 3, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1000;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1100;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1010;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1110;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd1)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 1, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd111)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd111);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1001;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1101;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd4)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 4, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd101)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd101);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b0111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1011;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	total_test_cases = total_test_cases + 1;
	#(1*PERIOD) force fsm1.state_reg = 3'd4;
	{i0, i1, i2, i3} = 4'b1111;
	#(1*PERIOD) release fsm1.state_reg;
	#(1*PERIOD);
	if(state_reg != 3'd3)
	begin
		$error("Performed transition %b with current state %d which expects next state(%d) but got next state value: %d", {i0, i1, i2, i3}, 4, 3, state_reg);
		next_state_err_cnt = next_state_err_cnt + 1;
	end
	if({o0, o1, o2} != 3'd000)
	begin
		$error("Invalid output for current state(%d): %b, expected output:%b", state_reg, {o0, o1, o2}, 3'd000);
		output_err_cnt = output_err_cnt + 1;
	end
	
	#(1*PERIOD);
	if (output_err_cnt > 0 || next_state_err_cnt > 0)
	begin
		$error("Failed %d test cases out of %d", (output_err_cnt > next_state_err_cnt) ? output_err_cnt : next_state_err_cnt, total_test_cases);
	end
	else
		$display("All tests passed successfully!");
	$finish;
end


endmodule