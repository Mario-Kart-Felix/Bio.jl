# WARNING: This file was generated from bed.rl using ragel. Do not edit!
immutable BED <: FileFormat end


"""Metadata for BED interval records"""
type BEDMetadata
    used_fields::Int # how many of the first n fields are used
    name::StringField
    score::Int
    thick_first::Int
    thick_last::Int
    item_rgb::RGB{Float32}
    block_count::Int
    block_sizes::Vector{Int}
    block_firsts::Vector{Int}
end


function BEDMetadata()
    return BEDMetadata(0, StringField(), 0, 0, 0, RGB{Float32}(0.0, 0.0, 0.0),
                       0, Int[], Int[])
end


function Base.copy(metadata::BEDMetadata)
    return BEDMetadata(
        metadata.used_fields, copy(metadata.name),
        metadata.score, metadata.thick_first, metadata.thick_last,
        metadata.item_rgb, metadata.block_count,
        metadata.block_sizes[1:metadata.block_count],
        metadata.block_firsts[1:metadata.block_count])
end


function Base.(:(==))(a::BEDMetadata, b::BEDMetadata)
    if a.used_fields != b.used_fields
        return false
    end

    n = a.used_fields
    ans = (n < 1 || a.name == b.name) &&
          (n < 2 || a.score == b.score) &&
          (n < 4 || a.thick_first == b.thick_first) &&
          (n < 5 || a.thick_last == b.thick_last) &&
          (n < 6 || a.item_rgb == b.item_rgb) &&
          (n < 7 || a.block_count == b.block_count)
    if !ans
        return false
    end

    if n >= 8
        for i in 1:a.block_count
            if a.block_sizes[i] != b.block_sizes[i]
                return false
            end
        end
    end

    if n >= 9
        for i in 1:a.block_count
            if a.block_sizes[i] != b.block_sizes[i]
                return false
            end
        end
    end

    return true
end

# TODO
#function show(io::IO, metadata::BEDMetadata)
#end


"An `Interval` with associated metadata from a BED file"
typealias BEDInterval Interval{BEDMetadata}


module BEDParserImpl

import Bio.Ragel, Bio.Intervals
using Bio: AbstractParser, StringField
using Bio.Intervals: Strand, STRAND_NA, BED, BEDInterval, BEDMetadata
using BufferedStreams, Switch, Compat, Colors


const bed_start  = convert(Int , 41)
const bed_first_final  = convert(Int , 41)
const bed_error  = convert(Int , 0)
const bed_en_main  = convert(Int , 41)
type BEDParser <: AbstractParser
    state::Ragel.State

    # intermediate values used during parsing
    red::Float32
    green::Float32
    blue::Float32
    block_size_idx::Int
    block_first_idx::Int

    function BEDParser(input::BufferedInputStream)
        cs = bed_start;
	return new(Ragel.State(cs, input), 0.0, 0.0, 0.0, 1, 1)
    end
end


function Intervals.metadatatype(::BEDParser)
    return BEDMetadata
end


function Base.eltype(::Type{BEDParser})
    return BEDInterval
end


function Base.open(input::BufferedInputStream, ::Type{BED})
    return BEDParser(input)
end


Ragel.@generate_read_fuction("bed", BEDParser, BEDInterval,
    begin
        if p == pe
	@goto _test_eof

end
@switch cs  begin
    @case 41
@goto st_case_41
@case 0
@goto st_case_0
@case 1
@goto st_case_1
@case 2
@goto st_case_2
@case 3
@goto st_case_3
@case 4
@goto st_case_4
@case 5
@goto st_case_5
@case 6
@goto st_case_6
@case 7
@goto st_case_7
@case 8
@goto st_case_8
@case 9
@goto st_case_9
@case 10
@goto st_case_10
@case 11
@goto st_case_11
@case 12
@goto st_case_12
@case 13
@goto st_case_13
@case 14
@goto st_case_14
@case 15
@goto st_case_15
@case 16
@goto st_case_16
@case 17
@goto st_case_17
@case 18
@goto st_case_18
@case 19
@goto st_case_19
@case 20
@goto st_case_20
@case 21
@goto st_case_21
@case 22
@goto st_case_22
@case 23
@goto st_case_23
@case 24
@goto st_case_24
@case 25
@goto st_case_25
@case 26
@goto st_case_26
@case 27
@goto st_case_27
@case 28
@goto st_case_28
@case 29
@goto st_case_29
@case 30
@goto st_case_30
@case 42
@goto st_case_42
@case 31
@goto st_case_31
@case 32
@goto st_case_32
@case 33
@goto st_case_33
@case 34
@goto st_case_34
@case 35
@goto st_case_35
@case 36
@goto st_case_36
@case 37
@goto st_case_37
@case 38
@goto st_case_38
@case 39
@goto st_case_39
@case 40
@goto st_case_40

end
@goto st_out
@label ctr2
	input.state.linenum += 1
@goto st41
@label st41
p+= 1;
	if p == pe
	@goto _test_eof41

end
@label st_case_41
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr85
@case 10
@goto ctr2
@case 11
@goto st2
@case 13
@goto st3
@case 32
@goto ctr86

end
if 33 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto ctr87

end
@goto st0
@label st_case_0
@label st0
cs = 0;
	@goto _out
@label ctr83
	output.metadata.used_fields = 0; Ragel.@copy_from_anchor!(output.seqname)
@goto st1
@label ctr85
	Ragel.anchor!(state, p)
	output.metadata.used_fields = 0; Ragel.@copy_from_anchor!(output.seqname)
@goto st1
@label st1
p+= 1;
	if p == pe
	@goto _test_eof1

end
@label st_case_1
@switch ( data[1 + p ])  begin
    @case 9
@goto st2
@case 10
@goto ctr2
@case 11
@goto st2
@case 13
@goto st3
@case 32
@goto st2

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr4

end
@goto st0
@label st2
p+= 1;
	if p == pe
	@goto _test_eof2

end
@label st_case_2
@switch ( data[1 + p ])  begin
    @case 9
@goto st2
@case 10
@goto ctr2
@case 11
@goto st2
@case 13
@goto st3
@case 32
@goto st2

end
@goto st0
@label st3
p+= 1;
	if p == pe
	@goto _test_eof3

end
@label st_case_3
if ( data[1 + p ]) == 10
	@goto ctr2

end
@goto st0
@label ctr4
	Ragel.anchor!(state, p)
@goto st4
@label st4
p+= 1;
	if p == pe
	@goto _test_eof4

end
@label st_case_4
if ( data[1 + p ]) == 9
	@goto ctr5

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st4

end
@goto st0
@label ctr5
	output.first = 1 + Ragel.@int64_from_anchor!
@goto st5
@label st5
p+= 1;
	if p == pe
	@goto _test_eof5

end
@label st_case_5
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr7

end
@goto st0
@label ctr7
	Ragel.anchor!(state, p)
@goto st6
@label st6
p+= 1;
	if p == pe
	@goto _test_eof6

end
@label st_case_6
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr8
@case 10
@goto ctr9
@case 13
@goto ctr10

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st6

end
@goto st0
@label ctr8
	output.last = Ragel.@int64_from_anchor!
@goto st7
@label st7
p+= 1;
	if p == pe
	@goto _test_eof7

end
@label st_case_7
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr12
@case 10
@goto ctr13
@case 13
@goto ctr14

end
if 32 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto ctr15

end
@goto st0
@label ctr12
	Ragel.anchor!(state, p)
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
@goto st8
@label ctr79
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
@goto st8
@label st8
p+= 1;
	if p == pe
	@goto _test_eof8

end
@label st_case_8
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr16

end
@goto st0
@label ctr16
	Ragel.anchor!(state, p)
@goto st9
@label st9
p+= 1;
	if p == pe
	@goto _test_eof9

end
@label st_case_9
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr17
@case 10
@goto ctr18
@case 13
@goto ctr19

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st9

end
@goto st0
@label ctr17
	output.metadata.score = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st10
@label st10
p+= 1;
	if p == pe
	@goto _test_eof10

end
@label st_case_10
@switch ( data[1 + p ])  begin
    @case 43
@goto ctr21
@case 63
@goto ctr21

end
if 45 <= ( data[1 + p ]) && ( data[1 + p ]) <= 46
	@goto ctr21

end
@goto st0
@label ctr21
	output.strand = convert(Strand, (Ragel.@char))
@goto st11
@label st11
p+= 1;
	if p == pe
	@goto _test_eof11

end
@label st_case_11
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr22
@case 10
@goto ctr23
@case 13
@goto ctr24

end
@goto st0
@label ctr22
	output.metadata.used_fields += 1
@goto st12
@label st12
p+= 1;
	if p == pe
	@goto _test_eof12

end
@label st_case_12
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr25

end
@goto st0
@label ctr25
	Ragel.anchor!(state, p)
@goto st13
@label st13
p+= 1;
	if p == pe
	@goto _test_eof13

end
@label st_case_13
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr26
@case 10
@goto ctr27
@case 13
@goto ctr28

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st13

end
@goto st0
@label ctr26
	output.metadata.thick_first = 1 + Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st14
@label st14
p+= 1;
	if p == pe
	@goto _test_eof14

end
@label st_case_14
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr30

end
@goto st0
@label ctr30
	Ragel.anchor!(state, p)
@goto st15
@label st15
p+= 1;
	if p == pe
	@goto _test_eof15

end
@label st_case_15
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr31
@case 10
@goto ctr32
@case 13
@goto ctr33

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st15

end
@goto st0
@label ctr31
	output.metadata.thick_last = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st16
@label st16
p+= 1;
	if p == pe
	@goto _test_eof16

end
@label st_case_16
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr35

end
@goto st0
@label ctr35
	Ragel.anchor!(state, p)
@goto st17
@label st17
p+= 1;
	if p == pe
	@goto _test_eof17

end
@label st_case_17
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr36
@case 10
@goto ctr37
@case 11
@goto ctr38
@case 13
@goto ctr39
@case 32
@goto ctr38
@case 44
@goto ctr40

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st17

end
@goto st0
@label ctr36
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st18
@label st18
p+= 1;
	if p == pe
	@goto _test_eof18

end
@label st_case_18
@switch ( data[1 + p ])  begin
    @case 9
@goto st19
@case 11
@goto st19
@case 32
@goto st19
@case 44
@goto st20

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr44

end
@goto st0
@label ctr38
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
@goto st19
@label st19
p+= 1;
	if p == pe
	@goto _test_eof19

end
@label st_case_19
@switch ( data[1 + p ])  begin
    @case 9
@goto st19
@case 11
@goto st19
@case 32
@goto st19
@case 44
@goto st20

end
@goto st0
@label ctr40
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
@goto st20
@label st20
p+= 1;
	if p == pe
	@goto _test_eof20

end
@label st_case_20
@switch ( data[1 + p ])  begin
    @case 9
@goto st20
@case 11
@goto st20
@case 32
@goto st20

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr45

end
@goto st0
@label ctr45
	Ragel.anchor!(state, p)
@goto st21
@label st21
p+= 1;
	if p == pe
	@goto _test_eof21

end
@label st_case_21
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr46
@case 11
@goto ctr46
@case 32
@goto ctr46
@case 44
@goto ctr47

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st21

end
@goto st0
@label ctr46
	input.green = (Ragel.@int64_from_anchor!) / 255.0
@goto st22
@label st22
p+= 1;
	if p == pe
	@goto _test_eof22

end
@label st_case_22
@switch ( data[1 + p ])  begin
    @case 9
@goto st22
@case 11
@goto st22
@case 32
@goto st22
@case 44
@goto st23

end
@goto st0
@label ctr47
	input.green = (Ragel.@int64_from_anchor!) / 255.0
@goto st23
@label st23
p+= 1;
	if p == pe
	@goto _test_eof23

end
@label st_case_23
@switch ( data[1 + p ])  begin
    @case 9
@goto st23
@case 11
@goto st23
@case 32
@goto st23

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr51

end
@goto st0
@label ctr51
	Ragel.anchor!(state, p)
@goto st24
@label st24
p+= 1;
	if p == pe
	@goto _test_eof24

end
@label st_case_24
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr52
@case 10
@goto ctr53
@case 13
@goto ctr54

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st24

end
@goto st0
@label ctr52
	input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st25
@label st25
p+= 1;
	if p == pe
	@goto _test_eof25

end
@label st_case_25
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr44

end
@goto st0
@label ctr44
	Ragel.anchor!(state, p)
@goto st26
@label st26
p+= 1;
	if p == pe
	@goto _test_eof26

end
@label st_case_26
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr56
@case 10
@goto ctr57
@case 13
@goto ctr58

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st26

end
@goto st0
@label ctr56
	output.metadata.block_count = Ragel.@int64_from_anchor!

        if (output.metadata.block_count > length(output.metadata.block_sizes))
            resize!(output.metadata.block_sizes, output.metadata.block_count)
        end

        if (output.metadata.block_count > length(output.metadata.block_firsts))
            resize!(output.metadata.block_firsts, output.metadata.block_count)
        end

	output.metadata.used_fields += 1
@goto st27
@label st27
p+= 1;
	if p == pe
	@goto _test_eof27

end
@label st_case_27
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr60

end
@goto st0
@label ctr60
	Ragel.anchor!(state, p)
@goto st28
@label st28
p+= 1;
	if p == pe
	@goto _test_eof28

end
@label st_case_28
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr61
@case 10
@goto ctr62
@case 13
@goto ctr63
@case 44
@goto ctr64

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st28

end
@goto st0
@label ctr78
	output.metadata.used_fields += 1
@goto st29
@label ctr61
	if input.block_size_idx > length(output.metadata.block_sizes)
            error("More size blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_sizes[input.block_size_idx] = Ragel.@int64_from_anchor!
        input.block_size_idx += 1

	output.metadata.used_fields += 1
@goto st29
@label st29
p+= 1;
	if p == pe
	@goto _test_eof29

end
@label st_case_29
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr66

end
@goto st0
@label ctr66
	Ragel.anchor!(state, p)
@goto st30
@label st30
p+= 1;
	if p == pe
	@goto _test_eof30

end
@label st_case_30
@switch ( data[1 + p ])  begin
    @case 10
@goto ctr67
@case 13
@goto ctr68
@case 44
@goto ctr69

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st30

end
@goto st0
@label ctr72
	input.state.linenum += 1
@goto st42
@label ctr9
	output.last = Ragel.@int64_from_anchor!
	input.state.linenum += 1
@goto st42
@label ctr13
	Ragel.anchor!(state, p)
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr18
	output.metadata.score = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr23
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr27
	output.metadata.thick_first = 1 + Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr32
	output.metadata.thick_last = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr37
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr53
	input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr57
	output.metadata.block_count = Ragel.@int64_from_anchor!

        if (output.metadata.block_count > length(output.metadata.block_sizes))
            resize!(output.metadata.block_sizes, output.metadata.block_count)
        end

        if (output.metadata.block_count > length(output.metadata.block_firsts))
            resize!(output.metadata.block_firsts, output.metadata.block_count)
        end

	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr62
	if input.block_size_idx > length(output.metadata.block_sizes)
            error("More size blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_sizes[input.block_size_idx] = Ragel.@int64_from_anchor!
        input.block_size_idx += 1

	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr67
	if input.block_first_idx > length(output.metadata.block_firsts)
            error("More start blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_firsts[input.block_first_idx] = 1 + Ragel.@int64_from_anchor!
        input.block_first_idx += 1

	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label ctr80
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
	input.state.linenum += 1
@goto st42
@label st42
p+= 1;
	if p == pe
	@goto _test_eof42

end
@label st_case_42
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr88
@case 10
@goto ctr72
@case 11
@goto st32
@case 13
@goto st33
@case 32
@goto ctr89

end
if 33 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto ctr90

end
@goto st0
@label ctr74
	output.metadata.used_fields = 0; Ragel.@copy_from_anchor!(output.seqname)
@goto st31
@label ctr88
	input.block_size_idx = 1
        input.block_first_idx = 1

        yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@anchor!
        	p+= 1; cs = 31; @goto _out



	Ragel.anchor!(state, p)
	output.metadata.used_fields = 0; Ragel.@copy_from_anchor!(output.seqname)
@goto st31
@label st31
p+= 1;
	if p == pe
	@goto _test_eof31

end
@label st_case_31
@switch ( data[1 + p ])  begin
    @case 9
@goto st32
@case 10
@goto ctr72
@case 11
@goto st32
@case 13
@goto st33
@case 32
@goto st32

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr4

end
@goto st0
@label st32
p+= 1;
	if p == pe
	@goto _test_eof32

end
@label st_case_32
@switch ( data[1 + p ])  begin
    @case 9
@goto st32
@case 10
@goto ctr72
@case 11
@goto st32
@case 13
@goto st33
@case 32
@goto st32

end
@goto st0
@label ctr10
	output.last = Ragel.@int64_from_anchor!
@goto st33
@label ctr14
	Ragel.anchor!(state, p)
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
@goto st33
@label ctr19
	output.metadata.score = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st33
@label ctr24
	output.metadata.used_fields += 1
@goto st33
@label ctr28
	output.metadata.thick_first = 1 + Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st33
@label ctr33
	output.metadata.thick_last = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st33
@label ctr39
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st33
@label ctr54
	input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st33
@label ctr58
	output.metadata.block_count = Ragel.@int64_from_anchor!

        if (output.metadata.block_count > length(output.metadata.block_sizes))
            resize!(output.metadata.block_sizes, output.metadata.block_count)
        end

        if (output.metadata.block_count > length(output.metadata.block_firsts))
            resize!(output.metadata.block_firsts, output.metadata.block_count)
        end

	output.metadata.used_fields += 1
@goto st33
@label ctr63
	if input.block_size_idx > length(output.metadata.block_sizes)
            error("More size blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_sizes[input.block_size_idx] = Ragel.@int64_from_anchor!
        input.block_size_idx += 1

	output.metadata.used_fields += 1
@goto st33
@label ctr68
	if input.block_first_idx > length(output.metadata.block_firsts)
            error("More start blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_firsts[input.block_first_idx] = 1 + Ragel.@int64_from_anchor!
        input.block_first_idx += 1

	output.metadata.used_fields += 1
@goto st33
@label ctr81
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
@goto st33
@label st33
p+= 1;
	if p == pe
	@goto _test_eof33

end
@label st_case_33
if ( data[1 + p ]) == 10
	@goto ctr72

end
@goto st0
@label ctr89
	input.block_size_idx = 1
        input.block_first_idx = 1

        yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@anchor!
        	p+= 1; cs = 34; @goto _out



	Ragel.anchor!(state, p)
@goto st34
@label st34
p+= 1;
	if p == pe
	@goto _test_eof34

end
@label st_case_34
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr74
@case 10
@goto ctr72
@case 11
@goto st32
@case 13
@goto st33
@case 32
@goto st34

end
if 33 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto st35

end
@goto st0
@label ctr87
	Ragel.anchor!(state, p)
@goto st35
@label ctr90
	input.block_size_idx = 1
        input.block_first_idx = 1

        yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@anchor!
        	p+= 1; cs = 35; @goto _out



	Ragel.anchor!(state, p)
@goto st35
@label st35
p+= 1;
	if p == pe
	@goto _test_eof35

end
@label st_case_35
if ( data[1 + p ]) == 9
	@goto ctr77

end
if 32 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto st35

end
@goto st0
@label ctr77
	output.metadata.used_fields = 0; Ragel.@copy_from_anchor!(output.seqname)
@goto st36
@label st36
p+= 1;
	if p == pe
	@goto _test_eof36

end
@label st_case_36
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr4

end
@goto st0
@label ctr69
	if input.block_first_idx > length(output.metadata.block_firsts)
            error("More start blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_firsts[input.block_first_idx] = 1 + Ragel.@int64_from_anchor!
        input.block_first_idx += 1

@goto st37
@label st37
p+= 1;
	if p == pe
	@goto _test_eof37

end
@label st_case_37
@switch ( data[1 + p ])  begin
    @case 10
@goto ctr23
@case 13
@goto ctr24

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr66

end
@goto st0
@label ctr64
	if input.block_size_idx > length(output.metadata.block_sizes)
            error("More size blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_sizes[input.block_size_idx] = Ragel.@int64_from_anchor!
        input.block_size_idx += 1

@goto st38
@label st38
p+= 1;
	if p == pe
	@goto _test_eof38

end
@label st_case_38
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr78
@case 10
@goto ctr23
@case 13
@goto ctr24

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr60

end
@goto st0
@label ctr15
	Ragel.anchor!(state, p)
@goto st39
@label st39
p+= 1;
	if p == pe
	@goto _test_eof39

end
@label st_case_39
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr79
@case 10
@goto ctr80
@case 13
@goto ctr81

end
if 32 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto st39

end
@goto st0
@label ctr86
	Ragel.anchor!(state, p)
@goto st40
@label st40
p+= 1;
	if p == pe
	@goto _test_eof40

end
@label st_case_40
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr83
@case 10
@goto ctr2
@case 11
@goto st2
@case 13
@goto st3
@case 32
@goto st40

end
if 33 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto st35

end
@goto st0
@label st_out
@label _test_eof41
cs = 41; @goto _test_eof
@label _test_eof1
cs = 1; @goto _test_eof
@label _test_eof2
cs = 2; @goto _test_eof
@label _test_eof3
cs = 3; @goto _test_eof
@label _test_eof4
cs = 4; @goto _test_eof
@label _test_eof5
cs = 5; @goto _test_eof
@label _test_eof6
cs = 6; @goto _test_eof
@label _test_eof7
cs = 7; @goto _test_eof
@label _test_eof8
cs = 8; @goto _test_eof
@label _test_eof9
cs = 9; @goto _test_eof
@label _test_eof10
cs = 10; @goto _test_eof
@label _test_eof11
cs = 11; @goto _test_eof
@label _test_eof12
cs = 12; @goto _test_eof
@label _test_eof13
cs = 13; @goto _test_eof
@label _test_eof14
cs = 14; @goto _test_eof
@label _test_eof15
cs = 15; @goto _test_eof
@label _test_eof16
cs = 16; @goto _test_eof
@label _test_eof17
cs = 17; @goto _test_eof
@label _test_eof18
cs = 18; @goto _test_eof
@label _test_eof19
cs = 19; @goto _test_eof
@label _test_eof20
cs = 20; @goto _test_eof
@label _test_eof21
cs = 21; @goto _test_eof
@label _test_eof22
cs = 22; @goto _test_eof
@label _test_eof23
cs = 23; @goto _test_eof
@label _test_eof24
cs = 24; @goto _test_eof
@label _test_eof25
cs = 25; @goto _test_eof
@label _test_eof26
cs = 26; @goto _test_eof
@label _test_eof27
cs = 27; @goto _test_eof
@label _test_eof28
cs = 28; @goto _test_eof
@label _test_eof29
cs = 29; @goto _test_eof
@label _test_eof30
cs = 30; @goto _test_eof
@label _test_eof42
cs = 42; @goto _test_eof
@label _test_eof31
cs = 31; @goto _test_eof
@label _test_eof32
cs = 32; @goto _test_eof
@label _test_eof33
cs = 33; @goto _test_eof
@label _test_eof34
cs = 34; @goto _test_eof
@label _test_eof35
cs = 35; @goto _test_eof
@label _test_eof36
cs = 36; @goto _test_eof
@label _test_eof37
cs = 37; @goto _test_eof
@label _test_eof38
cs = 38; @goto _test_eof
@label _test_eof39
cs = 39; @goto _test_eof
@label _test_eof40
cs = 40; @goto _test_eof
@label _test_eof
if p == eof
	@switch cs  begin
    @case 42
	input.block_size_idx = 1
        input.block_first_idx = 1

        yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@anchor!
        	p+= 1; cs = 0; @goto _out




	break;

end

end
@label _out
end)



end # module BEDParserImpl


# TODO: Rewrite this stuff

"""
Write a BEDInterval in BED format.
"""
function write(out::IO, interval::BEDInterval)
    print(out, interval.seqname, '\t', interval.first - 1, '\t', interval.last)
    write_optional_fields(out, interval)
    write(out, '\n')
end


function write_optional_fields(out::IO, interval::BEDInterval, leadingtab::Bool=true)
    if interval.metadata.used_fields >= 1
        if leadingtab
            write(out, '\t')
        end
        print(out, interval.metadata.name)
    else return end

    if interval.metadata.used_fields >= 2
        print(out, '\t', interval.metadata.score)
    else return end

    if interval.metadata.used_fields >= 3
        print(out, '\t', interval.strand)
    else return end

    if interval.metadata.used_fields >= 4
        print(out, '\t', interval.metadata.thick_first - 1)
    else return end

    if interval.metadata.used_fields >= 5
        print(out, '\t', interval.metadata.thick_last)
    else return end

    if interval.metadata.used_fields >= 6
        item_rgb = interval.metadata.item_rgb
        print(out, '\t',
              round(Int, 255 * item_rgb.r), ',',
              round(Int, 255 * item_rgb.g), ',',
              round(Int, 255 * item_rgb.b))
    else return end

    if interval.metadata.used_fields >= 7
        print(out, '\t', interval.metadata.block_count)
    else return end

    if interval.metadata.used_fields >= 8
        block_sizes = interval.metadata.block_sizes
        if !isempty(block_sizes)
            print(out, '\t', block_sizes[1])
            for i in 2:length(block_sizes)
                print(out, ',', block_sizes[i])
            end
        end
    else return end

    if interval.metadata.used_fields >= 9
        block_firsts = interval.metadata.block_firsts
        if !isempty(block_firsts)
            print(out, '\t', block_firsts[1] - 1)
            for i in 2:length(block_firsts)
                print(out, ',', block_firsts[i] - 1)
            end
        end
    end
end


function IntervalCollection(interval_stream::BEDParserImpl.BEDParser)
    intervals = collect(BEDInterval, interval_stream)
    return IntervalCollection{BEDMetadata}(intervals, true)
end


