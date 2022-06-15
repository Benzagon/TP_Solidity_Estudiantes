// SPDX-License-Identifier: MIT
    pragma solidity ^0.8.13;

    contract Estudiante
    {
        string private _nombre;
        string private _apellido;
        string private _curso;
        address private _docente;
        
        mapping(string => uint256)[4] private _bim_mat_notas;

        string[] private _materias;
        address[] private _docentes_asignados;

        event log_nota_agregada(string message, address indexed sender, uint256 bim, string materia, uint256 nota);

        constructor(string memory nombre_, string memory apellido_, string memory curso_)
        {
            _nombre = nombre_;
            _apellido = apellido_;
            _curso = curso_;

            _docente = msg.sender;
        }

        function get_apellido() public view returns(string memory)
        {
            return _apellido;
        }

        function get_nombre_completo() public view returns (string memory)
        {
            return string.concat(_nombre," ", _apellido);
        }

        function get_curso() public view returns(string memory)
        {
            return _curso;
        }

        function set_notamateria(uint256 nota_, string memory materia_, uint256 bim_) public
        {
            bool _isDocente = false;
            for(uint256 i = 0; i < _docentes_asignados.length; i++)
            {
                if(_docentes_asignados[i] == msg.sender)
                {
                    _isDocente = true;
                    break;
                }
            }

            require(msg.sender == _docente || _isDocente == true, "Solo el docente registrado puede asignar notas");
            
            _bim_mat_notas[bim_][materia_] = nota_;
            
            _materias.push(materia_);

            emit log_nota_agregada("Nota agregada con estas caracteristicas: ", msg.sender, bim_, materia_, nota_);
        }

        function set_docentes_asignados(address adress_docente_) public
        {
            require(msg.sender == _docente, "Solo el docente administrador puede asignar otros docentes");
            _docentes_asignados.push(adress_docente_);
        }

        function get_notamateria(string memory materia_, uint256 bim_) public view returns(uint256)
        {
            return _bim_mat_notas[bim_][materia_];
        }

        function aprobo(string memory materia_, uint256 bim_) public view returns(bool)
        {
            if(_bim_mat_notas[bim_][materia_] >= 60)
            {
                return true;
            }
            return false;
        }

        function promedio() public view returns(uint256)
        {
            uint256 _promedio = 0;

            for(uint256 i = 0; i < 4; i++)
            {
                for(uint256 j = 0; j < _materias.length; j++)
                {
                    _promedio += _bim_mat_notas[i][_materias[j]];
                }
            }

            _promedio /= _materias.length;
            return _promedio;
        }
    }