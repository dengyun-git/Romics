%%%%prepare work: get 461 species name in evolution tree order
% % % % fID=fopen('orderName461.csv');
% % % % XorderName=textscan(fID,'%s','Delimiter','\');
% % % % fclose(fID);
% % % % speciesName=XorderName{1,1};
% % % % save('orderName461.mat','speciesName');


load('orderName461.mat');

homoList={'YGL103W','YOL127W','YLR075W','YBL092W','YOR063W','YLR340W','YOR369C','YDR064W','YOL040C','YGL123W',...
    'YPL267W','YIL158W','YCL029C','YNL166C','YOR026W','YCL014W','YLR175W','YCR002C','YLR215C','YKL022C',...
    'YCL040W','YFR053C','YGL059W','YGL253W','YGR192C','YHR044C','YJL155C','YKL127W','YMR278W','YNL241C',...
    'YJL200C','YGR204W','YAL012W','YIL116W','YMR108W','YLR451W','YDL182W','YNL277W','YDR007W','YOR323C',...
    'YFR028C','YLR272C','YBR135W','YMR199W','YAL040C','YJL164C','YGL240W','YML027W','YDR201W','YDR293C'};

%%%%%homoList from 5818Rand
% fID=fopen('homoList5818Rand.txt');
% tt=textscan(fID,'%s',500,'Delimiter',',');
% fclose(fID);
% homoList=tt{1,1};
%
% % AAname={'Glu','His','Gln','Phe','Tyr','Cys','Asn','Lys','Asp','Ile',...
% %     'Pro','Thr','Ala','Val','Gly','Arg','Ser','Leu'};


%AAname={'Asp','Gly','Arg','Ile'};

AAname={'Ile'};


for aan=1:length(AAname)
    
    for homoCount=1:length(homoList)
        
        fileName=[homoList{homoCount},'homology',AAname{aan},'.txt'];
        
        try
            
            X = singleHomoIn461(fileName,speciesName);
            
            Y(:,homoCount)=X;
            
            % % %         save(['HomoOri',AAname{aan},'.mat'],'Y');
            
        catch
            fNONEid=fopen('homologyTxtNone.txt','a');%%%% none homologyGeneValue.m generated txt file
            fprintf(fNONEid,'%s\n',[AAname{aan},'error:',num2str(homoCount)]);
            fclose(fNONEid);
        end
        
    end
    
%     HM=HeatMap(Y,'ColumnLabels',homoList(:),'Colormap',[1 0 0;1 0.05 0.05;1 0.1 0.1;1 0.15 0.15;1 0.2 0.2;1 0.25 0.25;1 0.3 0.3;1 0.35 0.35;1 0.4 0.4;1 0.45 0.45;1 0.6 0.6;1 0.85 0.85]);
% %     HM=HeatMap(Y,'ColumnLabels',homoList(:),'Colormap',[1 0.95 0.95;1 0.9 0.9;1 0.85 0.85;1 0.8 0.8;1 0.75 0.75;1 0.7 0.7;1,0.5,0.5;1 0.3 0.3;1,0.25,0.25;1 0.15,0.15],'ColumnLabels',homoList);
%     title=[AAname{aan},': for 50 genes homology analysis in 461 species'];
%     addTitle(HM,title);
%     ylabel('species','FontSize',14);
heatmap(Y,homoList,[],'TickAngle', 45, 'Colorbar', {'SouthOutside'});
    
end

%clustergram(Y,'Colormap',[1 0.95 0.95;1 0.9 0.9;1 0.85 0.85;1 0.8 0.8;1 0.75 0.75;1 0.7 0.7;1,0.5,0.5;1 0.3 0.3;1,0.25,0.25;1 0.15,0.15]);

%%%%compare original  & artificial not completed code for Plot in thesis
%%%%'Ile50Gene.pdf'...

% homoList={'YGL103W','YOL127W','YLR075W','YBL092W','YOR063W','YLR340W','YOR369C','YDR064W','YOL040C','YGL123W',...
%     'YPL267W','YIL158W','YCL029C','YNL166C','YOR026W','YCL014W','YLR175W','YCR002C','YLR215C','YKL022C',...
%     'YCL040W','YFR053C','YGL059W','YGL253W','YGR192C','YHR044C','YJL155C','YKL127W','YMR278W','YNL241C',...
%     'YJL200C','YGR204W','YAL012W','YIL116W','YMR108W','YLR451W','YDL182W','YNL277W','YDR007W','YOR323C',...
%     'YFR028C','YLR272C','YBR135W','YMR199W','YAL040C','YJL164C','YGL240W','YML027W','YDR201W','YDR293C'};
% 
% AAname={'Asp','Gly','Arg','Ile'};
% 
% aan=4;
% filename=['HomoOri',AAname{aan},'.mat'];
% load(filename);
% YOasp=Y;
% 
% filename=['HomoArti',AAname{aan},'.mat'];
% load(filename);
% YAasp=Y;
% length(find(YOasp-YAasp<=0));
% 
% Yfinal=[YOasp;YAasp];
% homoListF(1:50)=homoList(:);
% % homoListF(51:100)=homoList(:);
% 
% HM=HeatMap(Yfinal,'ColumnLabels',homoListF(:),'Colormap',[1 0 0;1 0.05 0.05;1 0.1 0.1;1 0.15 0.15;1 0.2 0.2;1 0.3 0.3;1 0.6 0.6;1 0.85 0.85]);
% title=[AAname{aan},': 50 genes Original Vs Artificial homology analysis in 461 species'];
% addTitle(HM,title);
% addYLabel(HM,'species','FontSize',14);
% %
% % % %
% % % % % for i=1:50
% % % % %     for j=1:461
% % % % %     x=YOasp(j,i);
% % % % %     y=YAasp(j,i);
% % % % %     plot(x,y,'.');
% % % % %     hold on
% % % % %     end
% % % % % end
% % % % % hold off


%%%%self organised map
% Y(isnan(Y))=0;
% Ytrain=Y;
% net = selforgmap([5 5]);
% for trainC=1:1
% net = train(net,Ytrain);
% end


%%%%%%plot heatmap in thesis:
%load('HomoArtiIle.mat');
%Y1=Y;
%load('HomoOriIle.mat'); 
%Y2=Y;
%clear Y;
%Y=vertcat(Y2,Y1);