function save_xl(filename, rowname, columnname, struct, epsilon2, exp)
% save_xl will save the matlab structure into an excel sheet. Each sheet
% name is the epsilon value.

% INPUT:
    % For SRA and FBA:
        % row = medium components (50x1)
        % column = reactions (1x20)
        % body = data (50x20)
            % Growth rate
            % Metabolic flux
            % Shadow price
            % Reduced cost
    % For FVA:
        % row = medium components (50x1)
        % column = reactions (1x20)
        % body = data (50x20)
            % Excess min/max flux
            % Depletion min/max flux

if verLessThan('matlab', '9.6.0.1072779')
    switch exp
        case {'sra', 'competition', 'no_competition'}

            %% Growth rate
            excess_grate = struct.excess_grate;
            depletion_grate = struct.depletion_grate;

            % Excess
            xlswrite(filename, {'Excess Growth Rate'},  epsilon2, 'A1');
            xlswrite(filename, rowname,  epsilon2, 'A2:A51');
            xlswrite(filename, excess_grate,  epsilon2, 'B2:U51');

            % Depletion
            xlswrite(filename, {'Depletion Growth Rate'},  epsilon2,'W1');
            xlswrite(filename, rowname,  epsilon2,'X1:AQ1');
            xlswrite(filename, columnname,  epsilon2,'W2:W51');
            xlswrite(filename, depletion_grate,  epsilon2,'X2:AQ51');

            %% Metabolic flux
            excess_flux = struct.excess_flux;
            depletion_flux = struct.depletion_flux;

            % Excess
            xlswrite(filename, {'Excess Flux'},  epsilon2,'A53');
            xlswrite(filename, rowname,  epsilon2,'B53:U53');
            xlswrite(filename, columnname,  epsilon2,'A54:A103');
            xlswrite(filename, excess_flux,  epsilon2,'B53:U103');

            % Depletion
            xlswrite(filename, {'Depletion Flux'},  epsilon2,'W53');
            xlswrite(filename, rowname,  epsilon2,'X53:AQ53');
            xlswrite(filename, columnname,  epsilon2,'W54:W103');
            xlswrite(filename, depletion_flux,  epsilon2,'X53:AQ103');

            %% Shadow price
            excess_sp = struct.excess_flux_sp;
            depletion_sp = struct.depletion_flux_sp;

            % Excess
            xlswrite(filename, {'Excess Shadow Price'},  epsilon2,'A105');
            xlswrite(filename, rowname,  epsilon2,'B105:U105');
            xlswrite(filename, columnname,  epsilon2,'A106:A155');
            xlswrite(filename, excess_sp,  epsilon2,'B106:U155');

            % Depletion
            xlswrite(filename, {'Depletion Shadow Price'},  epsilon2,'W105');
            xlswrite(filename, rowname,  epsilon2,'X105:AQ105');
            xlswrite(filename, columnname,  epsilon2,'W106:W155');
            xlswrite(filename, depletion_sp,  epsilon2,'X106:AQ155');

            %% Reduced cost
            excess_rc = struct.excess_flux_rc;
            depletion_rc = struct.depletion_flux_rc;

            % Excess
            xlswrite(filename, {'Excess Reduced Cost'},  epsilon2,'A157');
            xlswrite(filename, rowname,  epsilon2,'B157:U157');
            xlswrite(filename, columnname,  epsilon2,'A158:A207');
            xlswrite(filename, excess_rc,  epsilon2,'B158:U207');

            % Depletion
            xlswrite(filename, {'Depletion Reduced Cost'},  epsilon2,'W157');
            xlswrite(filename, rowname,  epsilon2,'X157:AQ157');
            xlswrite(filename, columnname,  epsilon2,'W158:W207');
            xlswrite(filename, depletion_rc,  epsilon2,'X158:AQ207');


        case 'fva'
            % Maximum Flux
            excess_maxflux = struct.excess_maxflux;
            depletion_maxflux = struct.depletion_maxflux;

            % Excess
            xlswrite(filename, {'Excess Max Flux'},  epsilon2,'A1');
            xlswrite(filename, rowname,  epsilon2,'B1:U1');
            xlswrite(filename, columnname,  epsilon2,'A2:A51');
            xlswrite(filename, excess_maxflux,  epsilon2,'B2:U51');

            % Depletion
            xlswrite(filename, {'Depletion Max Flux'},  epsilon2,'W1');
            xlswrite(filename, rowname,  epsilon2,'X1:AQ1');
            xlswrite(filename, columnname,  epsilon2,'W2:W51');
            xlswrite(filename, depletion_maxflux,  epsilon2,'X2:AQ51');

            % Minimum flux
            excess_minflux = struct.excess_minflux;
            depletion_minflux = struct.depletion_minflux;

            % Excess
            xlswrite(filename, {'Excess Min Flux'},  epsilon2,'A53');
            xlswrite(filename, rowname,  epsilon2,'B53:U53');
            xlswrite(filename, columnname,  epsilon2,'A54:A103');
            xlswrite(filename, excess_minflux,  epsilon2,'B53:U103');

            % Depletion
            xlswrite(filename, {'Depletion Min Flux'},  epsilon2,'W53');
            xlswrite(filename, rowname,  epsilon2,'X53:AQ53');
            xlswrite(filename, columnname,  epsilon2,'W54:W103');
            xlswrite(filename, depletion_minflux,  epsilon2,'X53:AQ103');
    end

else
    switch exp

        case 'sra'
            %% Growth rate
            excess_grate = struct.excess_grate;
            depletion_grate = struct.depletion_grate;

            % Excess
            writecell({'Excess Growth Rate'}, filename, 'Sheet', epsilon2, 'Range', 'A1');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B1:U1');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A2:A51');
            writematrix(excess_grate, filename, 'Sheet', epsilon2, 'Range', 'B2:U51');

            % Depletion
            writecell({'Depletion Growth Rate'}, filename, 'Sheet', epsilon2, 'Range', 'W1');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X1:AQ1');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W2:W51');
            writematrix(depletion_grate, filename, 'Sheet', epsilon2, 'Range', 'X2:AQ51');

            %% Metabolic flux
            excess_flux = struct.excess_flux;
            depletion_flux = struct.depletion_flux;

            % Excess
            writecell({'Excess Flux'}, filename, 'Sheet', epsilon2, 'Range', 'A53');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B53:U53');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A54:A103');
            writematrix(excess_flux, filename, 'Sheet', epsilon2, 'Range', 'B53:U103');

            % Depletion
            writecell({'Depletion Flux'}, filename, 'Sheet', epsilon2, 'Range', 'W53');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X53:AQ53');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W54:W103');
            writematrix(depletion_flux, filename, 'Sheet', epsilon2, 'Range', 'X53:AQ103');

            %% Shadow price
            excess_sp = struct.excess_flux_sp;
            depletion_sp = struct.depletion_flux_sp;

            % Excess
            writecell({'Excess Shadow Price'}, filename, 'Sheet', epsilon2, 'Range', 'A105');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B105:U105');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A106:A155');
            writematrix(excess_sp, filename, 'Sheet', epsilon2, 'Range', 'B106:U155');

            % Depletion
            writecell({'Depletion Shadow Price'}, filename, 'Sheet', epsilon2, 'Range', 'W105');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X105:AQ105');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W106:W155');
            writematrix(depletion_sp, filename, 'Sheet', epsilon2, 'Range', 'X106:AQ155');

            %% Reduced cost
            excess_rc = struct.excess_flux_rc;
            depletion_rc = struct.depletion_flux_rc;

            % Excess
            writecell({'Excess Reduced Cost'}, filename, 'Sheet', epsilon2, 'Range', 'A157');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B157:U157');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A158:A207');
            writematrix(excess_rc, filename, 'Sheet', epsilon2, 'Range', 'B158:U207');

            % Depletion
            writecell({'Depletion Reduced Cost'}, filename, 'Sheet', epsilon2, 'Range', 'W157');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X157:AQ157');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W158:W207');
            writematrix(depletion_rc, filename, 'Sheet', epsilon2, 'Range', 'X158:AQ207');

        case 'fba'
            %% Growth rate
            excess_grate = struct.excess_grate;
            depletion_grate = struct.depletion_grate;

            % Excess
            writecell({'Excess Growth Rate'}, filename, 'Sheet', epsilon2, 'Range', 'A1');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B1:U1');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A2:A51');
            writematrix(excess_grate, filename, 'Sheet', epsilon2, 'Range', 'B2:U51');

            % Depletion
            writecell({'Depletion Growth Rate'}, filename, 'Sheet', epsilon2, 'Range', 'W1');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X1:AQ1');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W2:W51');
            writematrix(depletion_grate, filename, 'Sheet', epsilon2, 'Range', 'X2:AQ51');

            %% Metabolic flux
            excess_flux = struct.excess_flux;
            depletion_flux = struct.depletion_flux;

            % Excess
            writecell({'Excess Flux'}, filename, 'Sheet', epsilon2, 'Range', 'A53');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B53:U53');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A54:A103');
            writematrix(excess_flux, filename, 'Sheet', epsilon2, 'Range', 'B53:U103');

            % Depletion
            writecell({'Depletion Flux'}, filename, 'Sheet', epsilon2, 'Range', 'W53');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X53:AQ53');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W54:W103');
            writematrix(depletion_flux, filename, 'Sheet', epsilon2, 'Range', 'X53:AQ103');

            %% Shadow price
            excess_sp = struct.excess_flux_sp;
            depletion_sp = struct.depletion_flux_sp;

            % Excess
            writecell({'Excess Shadow Price'}, filename, 'Sheet', epsilon2, 'Range', 'A105');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B105:U105');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A106:A155');
            writematrix(excess_sp, filename, 'Sheet', epsilon2, 'Range', 'B106:U155');

            % Depletion
            writecell({'Depletion Shadow Price'}, filename, 'Sheet', epsilon2, 'Range', 'W105');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X105:AQ105');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W106:W155');
            writematrix(depletion_sp, filename, 'Sheet', epsilon2, 'Range', 'X106:AQ155');

            %% Reduced cost
            excess_rc = struct.excess_flux_rc;
            depletion_rc = struct.depletion_flux_rc;

            % Excess
            writecell({'Excess Reduced Cost'}, filename, 'Sheet', epsilon2, 'Range', 'A157');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B157:U157');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A158:A207');
            writematrix(excess_rc, filename, 'Sheet', epsilon2, 'Range', 'B158:U207');

            % Depletion
            writecell({'Depletion Reduced Cost'}, filename, 'Sheet', epsilon2, 'Range', 'W157');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X157:AQ157');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W158:W207');
            writematrix(depletion_rc, filename, 'Sheet', epsilon2, 'Range', 'X158:AQ207');

        case 'fva'
            %% Max Flux
            excess_maxflux = struct.excess_maxflux;
            depletion_maxflux = struct.depletion_maxflux;

            % Excess
            writecell({'Excess Max Flux'}, filename, 'Sheet', epsilon2, 'Range', 'A1');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B1:U1');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A2:A51');
            writematrix(excess_maxflux, filename, 'Sheet', epsilon2, 'Range', 'B2:U51');

            % Depletion
            writecell({'Depletion Max Flux'}, filename, 'Sheet', epsilon2, 'Range', 'W1');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X1:AQ1');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W2:W51');
            writematrix(depletion_maxflux, filename, 'Sheet', epsilon2, 'Range', 'X2:AQ51');

            %% Metabolic flux
            excess_minflux = struct.excess_minflux;
            depletion_minflux = struct.depletion_minflux;

            % Excess
            writecell({'Excess Min Flux'}, filename, 'Sheet', epsilon2, 'Range', 'A53');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'B53:U53');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'A54:A103');
            writematrix(excess_minflux, filename, 'Sheet', epsilon2, 'Range', 'B53:U103');

            % Depletion
            writecell({'Depletion Min Flux'}, filename, 'Sheet', epsilon2, 'Range', 'W53');
            writematrix(rowname, filename, 'Sheet', epsilon2, 'Range', 'X53:AQ53');
            writematrix(columnname, filename, 'Sheet', epsilon2, 'Range', 'W54:W103');
            writematrix(depletion_minflux, filename, 'Sheet', epsilon2, 'Range', 'X53:AQ103');
end
end
