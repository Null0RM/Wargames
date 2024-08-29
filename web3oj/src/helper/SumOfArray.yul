object "SumOfArray" {
    code {
        function sum(_a) -> ret {
            let end := add(_a, 0xca0)
            for {} lt(_a, end) {} {
                _a := add(_a, 0x20)
                ret := add(ret, mload(_a))
            }
            return(ret, 0x20)
        }
    }
}
