function calcMortgage()
            {
                // P = L[c(1 + c)n]/[(1 + c)n - 1]
                // B = L[(1 + c)n - (1 + c)p]/[(1 + c)n - 1]
                // L - F = P1/(1 + i) + P2/(1 + i)2 +… (Pn + Bn)/(1 + i)n
                // http://www.mtgprofessor.com/formulas.htm
                
                /*
                    P - Payment
                    r - rate
                    PV - Principle Value
                    n - term
                */
                
                var pv = document.getElementById('princ').value;
                var r = document.getElementById('rate').value/100;
                var n = document.getElementById('term').value;
                
                document.getElementById('result').value =  ((r/12)*(pv) /( 1-Math.pow( (1+(r/12)), (-n*12) ) )).toFixed(2);
            }