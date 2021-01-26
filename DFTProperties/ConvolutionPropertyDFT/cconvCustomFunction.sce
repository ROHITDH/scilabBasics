function[yc] = cconv(x,h)
    lx = length(x)
    lh = length(h)
    N = max(lx,lh)
    
    x = [x zeros(1,N-lx)]
    h = [h zeros(1,N-lh)]
    
    //to get 1st row of matrix
    xm = [x(1) flipdim(x(2:N),2)]
    yc = sum(xm.*h)
    
    //to get remaining rows of matrix
    for n = 2:N
        xm = [xm(N) xm(1:N-1)]
        yc(n) = sum(xm.*h)
    end  
end
