function [z,ans]=Hungarian_homemade(marix)
a=marix;
b=a;
s=length(a);
ml=min(a');
for i=1:s
    a(i,:)=a(i,:)-ml(i);
end
mr=min(a);
for j=1:s
    a(:,j)=a(:,j)-mr(j);
end
num=0;
while(num~=s)  
    index=ones(s);
    index=a&index;
    index=~index;
    flag = zeros(s);
    ans = zeros(s);
    while(sum(sum(index)))
        for i=1:s
            t=0;
            l=0;
            for j=1:s
                if(flag(i,j)==0&&index(i,j)==1)
                    l=l+1;
                    t=j;
                end
            end
            if(l==1)
                flag(:,t)=flag(:,t)+1;
                index(:,t)=0;
                ans(i,t)=1;
            end
        end
        for j=1:s
            t=0;
            r=0;
            for i=1:s
                if(flag(i,j)==0&&index(i,j)==1)
                    r=r+1;
                    t=i;
                end
            end
            if(r==1)
                flag(t,:)=flag(t,:)+1;
                index(t,:)=0;
                ans(t,j)=1;
            end
        end
    end  
    num=sum(sum(ans));
    if(s==num)
        break;
    end
    m=max(max(a));
    for i=1:s
        for j=1:s
            if(flag(i,j)==0)
                if(a(i,j)<m)
                    m=a(i,j);
                end
            end
        end
    end
    for i=1:s
        for j=1:s
            if(flag(i,j)==0)
                a(i,j)=a(i,j)-m;
            end
            if(flag(i,j)==2)
                   a(i,j)=a(i,j)+m;
            end
       end
   end
end  
zm=ans.*b;
z=0;
z=sum(sum(zm));

