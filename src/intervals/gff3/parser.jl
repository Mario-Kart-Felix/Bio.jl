# WARNING: This file was generated from intervals/gff3/parser.rl using ragel. Do not edit!
#

const gff3parser_start  = 43
const gff3parser_first_final  = 43
const gff3parser_error  = 0
const gff3parser_en_main  = 43
const _gff3parser_nfa_targs = Int8[ 0, 0 ,  ]
const _gff3parser_nfa_offsets = Int8[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,  ]
const _gff3parser_nfa_push_actions = Int8[ 0, 0 ,  ]
const _gff3parser_nfa_pop_trans = Int8[ 0, 0 ,  ]
Ragel.@generate_read!_function(
"gff3parser",
GFF3Reader,
GFF3Interval,
begin
begin
if ( p == pe  )
	@goto _test_eof

end
if ( cs  == 43 )
	@goto st_case_43
elseif ( cs  == 0 )
	@goto st_case_0
elseif ( cs  == 1 )
	@goto st_case_1
elseif ( cs  == 2 )
	@goto st_case_2
elseif ( cs  == 3 )
	@goto st_case_3
elseif ( cs  == 4 )
	@goto st_case_4
elseif ( cs  == 5 )
	@goto st_case_5
elseif ( cs  == 6 )
	@goto st_case_6
elseif ( cs  == 7 )
	@goto st_case_7
elseif ( cs  == 8 )
	@goto st_case_8
elseif ( cs  == 9 )
	@goto st_case_9
elseif ( cs  == 10 )
	@goto st_case_10
elseif ( cs  == 11 )
	@goto st_case_11
elseif ( cs  == 12 )
	@goto st_case_12
elseif ( cs  == 13 )
	@goto st_case_13
elseif ( cs  == 14 )
	@goto st_case_14
elseif ( cs  == 15 )
	@goto st_case_15
elseif ( cs  == 16 )
	@goto st_case_16
elseif ( cs  == 44 )
	@goto st_case_44
elseif ( cs  == 17 )
	@goto st_case_17
elseif ( cs  == 18 )
	@goto st_case_18
elseif ( cs  == 19 )
	@goto st_case_19
elseif ( cs  == 20 )
	@goto st_case_20
elseif ( cs  == 21 )
	@goto st_case_21
elseif ( cs  == 22 )
	@goto st_case_22
elseif ( cs  == 23 )
	@goto st_case_23
elseif ( cs  == 24 )
	@goto st_case_24
elseif ( cs  == 25 )
	@goto st_case_25
elseif ( cs  == 26 )
	@goto st_case_26
elseif ( cs  == 27 )
	@goto st_case_27
elseif ( cs  == 28 )
	@goto st_case_28
elseif ( cs  == 29 )
	@goto st_case_29
elseif ( cs  == 30 )
	@goto st_case_30
elseif ( cs  == 31 )
	@goto st_case_31
elseif ( cs  == 32 )
	@goto st_case_32
elseif ( cs  == 33 )
	@goto st_case_33
elseif ( cs  == 34 )
	@goto st_case_34
elseif ( cs  == 35 )
	@goto st_case_35
elseif ( cs  == 36 )
	@goto st_case_36
elseif ( cs  == 37 )
	@goto st_case_37
elseif ( cs  == 38 )
	@goto st_case_38
elseif ( cs  == 39 )
	@goto st_case_39
elseif ( cs  == 40 )
	@goto st_case_40
elseif ( cs  == 41 )
	@goto st_case_41
elseif ( cs  == 42 )
	@goto st_case_42
end
@goto st_out
@label ctr2
begin
input.state.linenum += 1
end
@goto st43
@label ctr72
begin
	directive = Ragel.@ascii_from_anchor!
		if 	startswith(directive, "##gff-version")
	# ##gff-version 3.2.1
	input.version = VersionNumber(split(directive, r"\s+")[2])
elseif startswith(directive, "##sequence-region")
	# ##sequence-region seqid start end
vals = split(directive, r"\s+")
push!(input.sequence_regions,
Interval(vals[2], parse(Int, vals[3]), parse(Int, vals[4])))
elseif 	startswith(directive, "##FASTA")
	input.fasta_seen = true
	input.state.finished = true
	if input.entry_seen
		Ragel.@yield 43
	else
		begin
		p+= 1;
		cs = 43;
		@goto _out

	end

end
else
			# TODO: record other directives
end
end
begin
	input.state.linenum += 1
end
@goto st43
@label st43
p+= 1;
if ( p == pe  )
	@goto _test_eof43

end
@label st_case_43
if ( (data[1+(p )]) == 9 )
begin
	@goto ctr74

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st4

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st4

end
elseif ( (data[1+(p )]) == 33 )
begin
@goto ctr75

end
elseif ( (data[1+(p )]) == 35 )
begin
@goto ctr76

end
elseif ( (data[1+(p )]) == 124 )
begin
@goto ctr75

end
end
if ( (data[1+(p )])< 48  )
begin
if ( (data[1+(p )])< 42  )
begin
if ( 36 <= (data[1+(p )])&& (data[1+(p )])<= 37  )
begin
@goto ctr75

end

end

end

elseif ( (data[1+(p )])> 43  )
begin
if ( 45 <= (data[1+(p )])&& (data[1+(p )])<= 46  )
begin
@goto ctr75

end

end

end

else
begin
@goto ctr75

end

end

end

elseif ( (data[1+(p )])> 58  )
begin
if ( (data[1+(p )])< 94  )
begin
if ( 63 <= (data[1+(p )])&& (data[1+(p )])<= 90  )
begin
@goto ctr75

end

end

end

elseif ( (data[1+(p )])> 95  )
begin
if ( 97 <= (data[1+(p )])&& (data[1+(p )])<= 122  )
begin
@goto ctr75

end

end

end

else
begin
@goto ctr75

end

end

end

else
begin
@goto ctr75

end

end
begin
@goto st0

end
@label st_case_0
@label st0
cs = 0;
@goto _out
@label ctr74
begin
Ragel.@anchor!
end
begin
input.entry_seen = true
empty!(output.metadata.attributes)
Ragel.@copy_from_anchor!(output.seqname)
end
@goto st1
@label st1
p+= 1;
if ( p == pe  )
@goto _test_eof1

end
@label st_case_1
if ( (data[1+(p )]) == 9 )
begin
@goto ctr0

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st4

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto ctr5

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr6

end

end
begin
@goto st0

end
@label ctr0
begin
Ragel.@anchor!
end
begin
Ragel.@copy_from_anchor!(output.metadata.source)
end
@goto st2
@label ctr68
begin
Ragel.@copy_from_anchor!(output.metadata.source)
end
@goto st2
@label st2
p+= 1;
if ( p == pe  )
@goto _test_eof2

end
@label st_case_2
if ( (data[1+(p )]) == 9 )
begin
@goto ctr7

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st4

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto ctr8

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr9

end

end
begin
@goto st0

end
@label ctr7
begin
Ragel.@anchor!
end
begin
Ragel.@copy_from_anchor!(output.metadata.kind)
end
@goto st3
@label ctr66
begin
Ragel.@copy_from_anchor!(output.metadata.kind)
end
@goto st3
@label st3
p+= 1;
if ( p == pe  )
@goto _test_eof3

end
@label st_case_3
if ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st4

end
end
if ( (data[1+(p )])> 11  )
begin
if ( 48 <= (data[1+(p )])&& (data[1+(p )])<= 57  )
begin
@goto ctr10

end

end

end

elseif ( (data[1+(p )])>= 9  )
begin
@goto st4

end

end
begin
@goto st0

end
@label st4
p+= 1;
if ( p == pe  )
@goto _test_eof4

end
@label st_case_4
if ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st4

end
end
if ( 9 <= (data[1+(p )])&& (data[1+(p )])<= 11  )
begin
@goto st4

end

end
begin
@goto st0

end
@label st5
p+= 1;
if ( p == pe  )
@goto _test_eof5

end
@label st_case_5
if ( (data[1+(p )])== 10  )
begin
@goto ctr2

end

end
begin
@goto st0

end
@label ctr10
begin
Ragel.@anchor!
end
@goto st6
@label st6
p+= 1;
if ( p == pe  )
@goto _test_eof6

end
@label st_case_6
if ( (data[1+(p )])== 9  )
begin
@goto ctr11

end

end
if ( 48 <= (data[1+(p )])&& (data[1+(p )])<= 57  )
begin
@goto st6

end

end
begin
@goto st0

end
@label ctr11
begin
output.first = Ragel.@int64_from_anchor!
end
@goto st7
@label st7
p+= 1;
if ( p == pe  )
@goto _test_eof7

end
@label st_case_7
if ( 48 <= (data[1+(p )])&& (data[1+(p )])<= 57  )
begin
@goto ctr13

end

end
begin
@goto st0

end
@label ctr13
begin
Ragel.@anchor!
end
@goto st8
@label st8
p+= 1;
if ( p == pe  )
@goto _test_eof8

end
@label st_case_8
if ( (data[1+(p )])== 9  )
begin
@goto ctr14

end

end
if ( 48 <= (data[1+(p )])&& (data[1+(p )])<= 57  )
begin
@goto st8

end

end
begin
@goto st0

end
@label ctr14
begin
output.last = Ragel.@int64_from_anchor!
end
@goto st9
@label st9
p+= 1;
if ( p == pe  )
@goto _test_eof9

end
@label st_case_9
if ( (data[1+(p )])== 46  )
begin
@goto ctr17

end

end
if ( (data[1+(p )])< 48  )
begin
if ( 32 <= (data[1+(p )]) )
begin
@goto ctr16

end

end

end

elseif ( (data[1+(p )])> 57  )
begin
if ( (data[1+(p )])<= 126  )
begin
@goto ctr16

end

end

end

else
begin
@goto ctr18

end

end
begin
@goto st0

end
@label ctr16
begin
Ragel.@anchor!
end
@goto st10
@label st10
p+= 1;
if ( p == pe  )
@goto _test_eof10

end
@label st_case_10
if ( (data[1+(p )])< 48  )
begin
if ( 32 <= (data[1+(p )]) )
begin
@goto st10

end

end

end

elseif ( (data[1+(p )])> 57  )
begin
if ( (data[1+(p )])<= 126  )
begin
@goto st10

end

end

end

else
begin
@goto st11

end

end
begin
@goto st0

end
@label ctr18
begin
Ragel.@anchor!
end
@goto st11
@label st11
p+= 1;
if ( p == pe  )
@goto _test_eof11

end
@label st_case_11
if ( (data[1+(p )])== 9  )
begin
@goto ctr21

end

end
if ( 32 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st11

end

end
begin
@goto st0

end
@label ctr21
begin
output.metadata.score = Nullable(Ragel.@float64_from_anchor!)
end
@goto st12
@label ctr65
begin
output.metadata.score = Nullable{Float64}()
end
@goto st12
@label st12
p+= 1;
if ( p == pe  )
@goto _test_eof12

end
@label st_case_12
if ( (data[1+(p )]) == 43 )
begin
@goto ctr22

end
elseif ( (data[1+(p )]) == 63 )
begin
@goto ctr22

end
end
if ( 45 <= (data[1+(p )])&& (data[1+(p )])<= 46  )
begin
@goto ctr22

end

end
begin
@goto st0

end
@label ctr22
begin
output.strand = convert(Strand, (Ragel.@char))
end
@goto st13
@label st13
p+= 1;
if ( p == pe  )
@goto _test_eof13

end
@label st_case_13
if ( (data[1+(p )])== 9  )
begin
@goto st14

end

end
begin
@goto st0

end
@label st14
p+= 1;
if ( p == pe  )
@goto _test_eof14

end
@label st_case_14
if ( (data[1+(p )])== 46  )
begin
@goto ctr24

end

end
if ( 48 <= (data[1+(p )])&& (data[1+(p )])<= 50  )
begin
@goto ctr25

end

end
begin
@goto st0

end
@label ctr24
begin
Ragel.@anchor!
end
@goto st15
@label st15
p+= 1;
if ( p == pe  )
@goto _test_eof15

end
@label st_case_15
if ( (data[1+(p )])== 9  )
begin
@goto ctr26

end

end
begin
@goto st0

end
@label ctr26
begin
output.metadata.phase = Nullable{Int}()
end
@goto st16
@label ctr58
begin
Ragel.@anchor!
end
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
@goto st16
@label ctr63
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
@goto st16
@label ctr64
begin
output.metadata.phase = Nullable(Ragel.@int64_from_anchor!)
end
@goto st16
@label st16
p+= 1;
if ( p == pe  )
@goto _test_eof16

end
@label st_case_16
if ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 61 )
begin
@goto ctr30

end
end
if ( (data[1+(p )])< 45  )
begin
if ( 32 <= (data[1+(p )])&& (data[1+(p )])<= 43  )
begin
@goto ctr29

end

end

end

elseif ( (data[1+(p )])> 58  )
begin
if ( 60 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr29

end

end

end

else
begin
@goto ctr29

end

end
begin
@goto st0

end
@label ctr27
begin
input.state.linenum += 1
end
@goto st44
@label ctr50
begin
directive = Ragel.@ascii_from_anchor!
if startswith(directive, "##gff-version")
# ##gff-version 3.2.1
input.version = VersionNumber(split(directive, r"\s+")[2])
elseif startswith(directive, "##sequence-region")
# ##sequence-region seqid start end
vals = split(directive, r"\s+")
push!(input.sequence_regions,
Interval(vals[2], parse(Int, vals[3]), parse(Int, vals[4])))
elseif startswith(directive, "##FASTA")
input.fasta_seen = true
input.state.finished = true
if input.entry_seen
Ragel.@yield 44
else
begin
p+= 1;
cs = 44;
@goto _out

end

end
else
# TODO: record other directives
end
end
begin
input.state.linenum += 1
end
@goto st44
@label ctr54
begin
Ragel.@anchor!
end
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
begin
input.state.linenum += 1
end
@goto st44
@label ctr59
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
begin
input.state.linenum += 1
end
@goto st44
@label st44
p+= 1;
if ( p == pe  )
@goto _test_eof44

end
@label st_case_44
if ( (data[1+(p )]) == 9 )
begin
@goto ctr77

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st20

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st20

end
elseif ( (data[1+(p )]) == 33 )
begin
@goto ctr78

end
elseif ( (data[1+(p )]) == 35 )
begin
@goto ctr79

end
elseif ( (data[1+(p )]) == 124 )
begin
@goto ctr78

end
end
if ( (data[1+(p )])< 48  )
begin
if ( (data[1+(p )])< 42  )
begin
if ( 36 <= (data[1+(p )])&& (data[1+(p )])<= 37  )
begin
@goto ctr78

end

end

end

elseif ( (data[1+(p )])> 43  )
begin
if ( 45 <= (data[1+(p )])&& (data[1+(p )])<= 46  )
begin
@goto ctr78

end

end

end

else
begin
@goto ctr78

end

end

end

elseif ( (data[1+(p )])> 58  )
begin
if ( (data[1+(p )])< 94  )
begin
if ( 63 <= (data[1+(p )])&& (data[1+(p )])<= 90  )
begin
@goto ctr78

end

end

end

elseif ( (data[1+(p )])> 95  )
begin
if ( 97 <= (data[1+(p )])&& (data[1+(p )])<= 122  )
begin
@goto ctr78

end

end

end

else
begin
@goto ctr78

end

end

end

else
begin
@goto ctr78

end

end
begin
@goto st0

end
@label ctr77
begin
Ragel.@anchor!
Ragel.@yield 17
end
begin
Ragel.@anchor!
end
begin
input.entry_seen = true
empty!(output.metadata.attributes)
Ragel.@copy_from_anchor!(output.seqname)
end
@goto st17
@label st17
p+= 1;
if ( p == pe  )
@goto _test_eof17

end
@label st_case_17
if ( (data[1+(p )]) == 9 )
begin
@goto ctr31

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st20

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto ctr33

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr6

end

end
begin
@goto st0

end
@label ctr31
begin
Ragel.@anchor!
end
begin
Ragel.@copy_from_anchor!(output.metadata.source)
end
@goto st18
@label ctr40
begin
Ragel.@copy_from_anchor!(output.metadata.source)
end
@goto st18
@label st18
p+= 1;
if ( p == pe  )
@goto _test_eof18

end
@label st_case_18
if ( (data[1+(p )]) == 9 )
begin
@goto ctr34

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st20

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto ctr35

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr9

end

end
begin
@goto st0

end
@label ctr34
begin
Ragel.@anchor!
end
begin
Ragel.@copy_from_anchor!(output.metadata.kind)
end
@goto st19
@label ctr36
begin
Ragel.@copy_from_anchor!(output.metadata.kind)
end
@goto st19
@label st19
p+= 1;
if ( p == pe  )
@goto _test_eof19

end
@label st_case_19
if ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st20

end
end
if ( (data[1+(p )])> 11  )
begin
if ( 48 <= (data[1+(p )])&& (data[1+(p )])<= 57  )
begin
@goto ctr10

end

end

end

elseif ( (data[1+(p )])>= 9  )
begin
@goto st20

end

end
begin
@goto st0

end
@label st20
p+= 1;
if ( p == pe  )
@goto _test_eof20

end
@label st_case_20
if ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st20

end
end
if ( 9 <= (data[1+(p )])&& (data[1+(p )])<= 11  )
begin
@goto st20

end

end
begin
@goto st0

end
@label ctr55
begin
Ragel.@anchor!
end
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
@goto st21
@label ctr60
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
@goto st21
@label st21
p+= 1;
if ( p == pe  )
@goto _test_eof21

end
@label st_case_21
if ( (data[1+(p )])== 10  )
begin
@goto ctr27

end

end
begin
@goto st0

end
@label ctr35
begin
Ragel.@anchor!
end
@goto st22
@label st22
p+= 1;
if ( p == pe  )
@goto _test_eof22

end
@label st_case_22
if ( (data[1+(p )]) == 9 )
begin
@goto ctr36

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st20

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st22

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st23

end

end
begin
@goto st0

end
@label ctr9
begin
Ragel.@anchor!
end
@goto st23
@label st23
p+= 1;
if ( p == pe  )
@goto _test_eof23

end
@label st_case_23
if ( (data[1+(p )])== 9  )
begin
@goto ctr39

end

end
if ( 32 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st23

end

end
begin
@goto st0

end
@label ctr44
begin
Ragel.@anchor!
end
begin
Ragel.@copy_from_anchor!(output.metadata.kind)
end
@goto st24
@label ctr39
begin
Ragel.@copy_from_anchor!(output.metadata.kind)
end
@goto st24
@label st24
p+= 1;
if ( p == pe  )
@goto _test_eof24

end
@label st_case_24
if ( 48 <= (data[1+(p )])&& (data[1+(p )])<= 57  )
begin
@goto ctr10

end

end
begin
@goto st0

end
@label ctr33
begin
Ragel.@anchor!
end
@goto st25
@label st25
p+= 1;
if ( p == pe  )
@goto _test_eof25

end
@label st_case_25
if ( (data[1+(p )]) == 9 )
begin
@goto ctr40

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st20

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st25

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st26

end

end
begin
@goto st0

end
@label ctr6
begin
Ragel.@anchor!
end
@goto st26
@label st26
p+= 1;
if ( p == pe  )
@goto _test_eof26

end
@label st_case_26
if ( (data[1+(p )])== 9  )
begin
@goto ctr43

end

end
if ( 32 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st26

end

end
begin
@goto st0

end
@label ctr47
begin
Ragel.@anchor!
end
begin
Ragel.@copy_from_anchor!(output.metadata.source)
end
@goto st27
@label ctr43
begin
Ragel.@copy_from_anchor!(output.metadata.source)
end
@goto st27
@label st27
p+= 1;
if ( p == pe  )
@goto _test_eof27

end
@label st_case_27
if ( (data[1+(p )])== 9  )
begin
@goto ctr44

end

end
if ( 32 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr9

end

end
begin
@goto st0

end
@label ctr75
begin
Ragel.@anchor!
end
@goto st28
@label ctr78
begin
Ragel.@anchor!
Ragel.@yield 28
end
begin
Ragel.@anchor!
end
@goto st28
@label st28
p+= 1;
if ( p == pe  )
@goto _test_eof28

end
@label st_case_28
if ( (data[1+(p )]) == 9 )
begin
@goto ctr45

end
elseif ( (data[1+(p )]) == 33 )
begin
@goto st28

end
elseif ( (data[1+(p )]) == 124 )
begin
@goto st28

end
end
if ( (data[1+(p )])< 48  )
begin
if ( (data[1+(p )])< 42  )
begin
if ( 36 <= (data[1+(p )])&& (data[1+(p )])<= 37  )
begin
@goto st28

end

end

end

elseif ( (data[1+(p )])> 43  )
begin
if ( 45 <= (data[1+(p )])&& (data[1+(p )])<= 46  )
begin
@goto st28

end

end

end

else
begin
@goto st28

end

end

end

elseif ( (data[1+(p )])> 58  )
begin
if ( (data[1+(p )])< 94  )
begin
if ( 63 <= (data[1+(p )])&& (data[1+(p )])<= 90  )
begin
@goto st28

end

end

end

elseif ( (data[1+(p )])> 95  )
begin
if ( 97 <= (data[1+(p )])&& (data[1+(p )])<= 122  )
begin
@goto st28

end

end

end

else
begin
@goto st28

end

end

end

else
begin
@goto st28

end

end
begin
@goto st0

end
@label ctr45
begin
input.entry_seen = true
empty!(output.metadata.attributes)
Ragel.@copy_from_anchor!(output.seqname)
end
@goto st29
@label st29
p+= 1;
if ( p == pe  )
@goto _test_eof29

end
@label st_case_29
if ( (data[1+(p )])== 9  )
begin
@goto ctr47

end

end
if ( 32 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr6

end

end
begin
@goto st0

end
@label ctr79
begin
Ragel.@anchor!
end
@goto st30
@label st30
p+= 1;
if ( p == pe  )
@goto _test_eof30

end
@label st_case_30
if ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 35 )
begin
@goto st32

end
end
begin
@goto st31

end
@label st31
p+= 1;
if ( p == pe  )
@goto _test_eof31

end
@label st_case_31
if ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 35 )
begin
@goto st0

end
end
begin
@goto st31

end
@label ctr51
begin
directive = Ragel.@ascii_from_anchor!
if startswith(directive, "##gff-version")
# ##gff-version 3.2.1
input.version = VersionNumber(split(directive, r"\s+")[2])
elseif startswith(directive, "##sequence-region")
# ##sequence-region seqid start end
vals = split(directive, r"\s+")
push!(input.sequence_regions,
Interval(vals[2], parse(Int, vals[3]), parse(Int, vals[4])))
elseif startswith(directive, "##FASTA")
input.fasta_seen = true
input.state.finished = true
if input.entry_seen
Ragel.@yield 32
else
begin
p+= 1;
cs = 32;
@goto _out

end

end
else
# TODO: record other directives
end
end
@goto st32
@label st32
p+= 1;
if ( p == pe  )
@goto _test_eof32

end
@label st_case_32
if ( (data[1+(p )]) == 10 )
begin
@goto ctr50

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr51

end
end
begin
@goto st32

end
@label ctr29
begin
Ragel.@anchor!
end
@goto st33
@label st33
p+= 1;
if ( p == pe  )
@goto _test_eof33

end
@label st_case_33
if ( (data[1+(p )])== 61  )
begin
@goto ctr53

end

end
if ( (data[1+(p )])< 45  )
begin
if ( 32 <= (data[1+(p )])&& (data[1+(p )])<= 43  )
begin
@goto st33

end

end

end

elseif ( (data[1+(p )])> 58  )
begin
if ( 60 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st33

end

end

end

else
begin
@goto st33

end

end
begin
@goto st0

end
@label ctr30
begin
Ragel.@anchor!
end
begin
Ragel.@copy_from_anchor!(input.key)
end
@goto st34
@label ctr53
begin
Ragel.@copy_from_anchor!(input.key)
end
@goto st34
@label ctr57
begin
Ragel.@anchor!
end
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
@goto st34
@label ctr62
begin
pushindex!(output.metadata.attributes, input.key,
input.state.stream.buffer, upanchor!(input.state.stream), p)
end
@goto st34
@label st34
p+= 1;
if ( p == pe  )
@goto _test_eof34

end
@label st_case_34
if ( (data[1+(p )]) == 10 )
begin
@goto ctr54

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr55

end
elseif ( (data[1+(p )]) == 44 )
begin
@goto ctr57

end
elseif ( (data[1+(p )]) == 59 )
begin
@goto ctr58

end
end
if ( (data[1+(p )])> 60  )
begin
if ( 62 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto ctr56

end

end

end

elseif ( (data[1+(p )])>= 32  )
begin
@goto ctr56

end

end
begin
@goto st0

end
@label ctr56
begin
Ragel.@anchor!
end
@goto st35
@label st35
p+= 1;
if ( p == pe  )
@goto _test_eof35

end
@label st_case_35
if ( (data[1+(p )]) == 10 )
begin
@goto ctr59

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr60

end
elseif ( (data[1+(p )]) == 44 )
begin
@goto ctr62

end
elseif ( (data[1+(p )]) == 59 )
begin
@goto ctr63

end
end
if ( (data[1+(p )])> 60  )
begin
if ( 62 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st35

end

end

end

elseif ( (data[1+(p )])>= 32  )
begin
@goto st35

end

end
begin
@goto st0

end
@label ctr25
begin
Ragel.@anchor!
end
@goto st36
@label st36
p+= 1;
if ( p == pe  )
@goto _test_eof36

end
@label st_case_36
if ( (data[1+(p )])== 9  )
begin
@goto ctr64

end

end
begin
@goto st0

end
@label ctr17
begin
Ragel.@anchor!
end
@goto st37
@label st37
p+= 1;
if ( p == pe  )
@goto _test_eof37

end
@label st_case_37
if ( (data[1+(p )])== 9  )
begin
@goto ctr65

end

end
if ( (data[1+(p )])< 48  )
begin
if ( 32 <= (data[1+(p )]) )
begin
@goto st10

end

end

end

elseif ( (data[1+(p )])> 57  )
begin
if ( (data[1+(p )])<= 126  )
begin
@goto st10

end

end

end

else
begin
@goto st11

end

end
begin
@goto st0

end
@label ctr8
begin
Ragel.@anchor!
end
@goto st38
@label st38
p+= 1;
if ( p == pe  )
@goto _test_eof38

end
@label st_case_38
if ( (data[1+(p )]) == 9 )
begin
@goto ctr66

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st4

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st38

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st23

end

end
begin
@goto st0

end
@label ctr5
begin
Ragel.@anchor!
end
@goto st39
@label st39
p+= 1;
if ( p == pe  )
@goto _test_eof39

end
@label st_case_39
if ( (data[1+(p )]) == 9 )
begin
@goto ctr68

end
elseif ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 11 )
begin
@goto st4

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st39

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
@goto st26

end

end
begin
@goto st0

end
@label ctr76
begin
Ragel.@anchor!
end
@goto st40
@label st40
p+= 1;
if ( p == pe  )
@goto _test_eof40

end
@label st_case_40
if ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 35 )
begin
@goto st42

end
end
begin
@goto st41

end
@label st41
p+= 1;
if ( p == pe  )
@goto _test_eof41

end
@label st_case_41
if ( (data[1+(p )]) == 10 )
begin
@goto ctr2

end
elseif ( (data[1+(p )]) == 35 )
begin
@goto st0

end
end
begin
@goto st41

end
@label ctr73
begin
directive = Ragel.@ascii_from_anchor!
if startswith(directive, "##gff-version")
# ##gff-version 3.2.1
input.version = VersionNumber(split(directive, r"\s+")[2])
elseif startswith(directive, "##sequence-region")
# ##sequence-region seqid start end
vals = split(directive, r"\s+")
push!(input.sequence_regions,
Interval(vals[2], parse(Int, vals[3]), parse(Int, vals[4])))
elseif startswith(directive, "##FASTA")
input.fasta_seen = true
input.state.finished = true
if input.entry_seen
Ragel.@yield 42
else
begin
p+= 1;
cs = 42;
@goto _out

end

end
else
# TODO: record other directives
end
end
@goto st42
@label st42
p+= 1;
if ( p == pe  )
@goto _test_eof42

end
@label st_case_42
if ( (data[1+(p )]) == 10 )
begin
@goto ctr72

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr73

end
end
begin
@goto st42

end
@label st_out
@label _test_eof43
cs = 43;
@goto _test_eof
@label _test_eof1
cs = 1;
@goto _test_eof
@label _test_eof2
cs = 2;
@goto _test_eof
@label _test_eof3
cs = 3;
@goto _test_eof
@label _test_eof4
cs = 4;
@goto _test_eof
@label _test_eof5
cs = 5;
@goto _test_eof
@label _test_eof6
cs = 6;
@goto _test_eof
@label _test_eof7
cs = 7;
@goto _test_eof
@label _test_eof8
cs = 8;
@goto _test_eof
@label _test_eof9
cs = 9;
@goto _test_eof
@label _test_eof10
cs = 10;
@goto _test_eof
@label _test_eof11
cs = 11;
@goto _test_eof
@label _test_eof12
cs = 12;
@goto _test_eof
@label _test_eof13
cs = 13;
@goto _test_eof
@label _test_eof14
cs = 14;
@goto _test_eof
@label _test_eof15
cs = 15;
@goto _test_eof
@label _test_eof16
cs = 16;
@goto _test_eof
@label _test_eof44
cs = 44;
@goto _test_eof
@label _test_eof17
cs = 17;
@goto _test_eof
@label _test_eof18
cs = 18;
@goto _test_eof
@label _test_eof19
cs = 19;
@goto _test_eof
@label _test_eof20
cs = 20;
@goto _test_eof
@label _test_eof21
cs = 21;
@goto _test_eof
@label _test_eof22
cs = 22;
@goto _test_eof
@label _test_eof23
cs = 23;
@goto _test_eof
@label _test_eof24
cs = 24;
@goto _test_eof
@label _test_eof25
cs = 25;
@goto _test_eof
@label _test_eof26
cs = 26;
@goto _test_eof
@label _test_eof27
cs = 27;
@goto _test_eof
@label _test_eof28
cs = 28;
@goto _test_eof
@label _test_eof29
cs = 29;
@goto _test_eof
@label _test_eof30
cs = 30;
@goto _test_eof
@label _test_eof31
cs = 31;
@goto _test_eof
@label _test_eof32
cs = 32;
@goto _test_eof
@label _test_eof33
cs = 33;
@goto _test_eof
@label _test_eof34
cs = 34;
@goto _test_eof
@label _test_eof35
cs = 35;
@goto _test_eof
@label _test_eof36
cs = 36;
@goto _test_eof
@label _test_eof37
cs = 37;
@goto _test_eof
@label _test_eof38
cs = 38;
@goto _test_eof
@label _test_eof39
cs = 39;
@goto _test_eof
@label _test_eof40
cs = 40;
@goto _test_eof
@label _test_eof41
cs = 41;
@goto _test_eof
@label _test_eof42
cs = 42;
@goto _test_eof
@label _test_eof
begin

end
if ( p == eof  )
begin
if ( cs  == 44 )
begin
Ragel.@anchor!
Ragel.@yield 0
end

break;
end

end

end
@label _out
begin

end

end
end)
