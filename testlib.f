c       исходный файл: testlib.f
c       компиляция: gfortran -shared testlib.f -o testlib.so

        double precision function f77_sin(x)
        double precision x
        f77_sin = dsin(x)
        end function f77_sin

c test2
        double precision function f77_sin2cos2(x)
        double precision x
        f77_sin2cos2 = dsin(x)**2 + dcos(x)**2
        end function f77_sin2cos2

c test3
        double precision function f77_polynom(x)
        double precision x
        f77_polynom = 100.d0 -5.d0*x + 7.d0*x**2 - x**3 - 6.5d0*x**4
     &      + 3.14d0*x**5 - 7.d0*x**6 - 6.4d0*x**7 - 0.1d0*x**8
        end function f77_polynom

c test4
        double precision function f77_cycpolynom(x)
        double precision x, res

        do i = 1, 10000000
            res = 100.d0 -5.d0*x + 7.d0*x**2 - x**3 - 6.5d0*x**4
     &          + 3.14d0*x**5 - 7.d0*x**6 - 6.4d0*x**7 - 0.1d0*x**8
        end do

        f77_cycpolynom = res
        end function f77_cycpolynom
